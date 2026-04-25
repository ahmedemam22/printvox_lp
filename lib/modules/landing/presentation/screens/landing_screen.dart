import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injection.dart';
import '../bloc/landing_bloc.dart';
import '../bloc/landing_event.dart';
import '../bloc/landing_state.dart';
import '../components/header/header_widget.dart';
import '../components/contact/contact_section_widget.dart';
import '../components/sectors/sectors_widget.dart';
import '../components/ideas/ideas_widget.dart';
import '../components/portfolio/portfolio_widget.dart';
import '../components/why_us/why_us_widget.dart';
import '../components/shared/landing_background.dart';
import '../components/footer/footer_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LandingBloc>()..add(FetchLandingData()),
      child: Scaffold(
        backgroundColor: const Color(0xFF07070F),
        body: Stack(
          children: [
            const LandingBackground(),
            const _LandingContent(),
          ],
        ),
      ),
    );
  }
}

class _LandingContent extends StatefulWidget {
  const _LandingContent();

  @override
  State<_LandingContent> createState() => _LandingContentState();
}

class _LandingContentState extends State<_LandingContent> {
  final ScrollController _scrollController = ScrollController();
  String _activeSection = 'services';
  
  final GlobalKey _ideasKey = GlobalKey();
  final GlobalKey _sectorsKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _whyUsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final scrollPosition = _scrollController.offset;
    
    // Quick escape if we're at the top
    if (scrollPosition < 50) {
      if (_activeSection != 'services') {
        setState(() => _activeSection = 'services');
      }
      return;
    }

    final sections = {
      'services': _ideasKey,
      'categories': _sectorsKey,
      'portfolio': _portfolioKey,
      'whyUs': _whyUsKey,
      'contact': _contactKey,
    };

    String? currentSection;
    double minDistance = double.infinity;

    for (var entry in sections.entries) {
      final context = entry.value.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;
        final distance = (position - 100).abs();
        if (distance < 300 && distance < minDistance) {
          minDistance = distance;
          currentSection = entry.key;
        }
      }
    }

    if (currentSection != null && currentSection != _activeSection) {
      setState(() {
        _activeSection = currentSection!;
      });
    }
  }

  void _scrollToSection(GlobalKey key, String sectionName) {
    _scrollController.removeListener(_onScroll);
    setState(() {
      _activeSection = sectionName;
    });
    
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      ).then((_) {
        _scrollController.addListener(_onScroll);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingBloc, LandingState>(
      builder: (context, state) {
        if (state is LandingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LandingError) {
          return Center(child: Text(state.message, style: const TextStyle(color: Colors.white)));
        } else if (state is LandingLoaded) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 80,
                flexibleSpace: HeaderWidget(
                  onCategoriesTap: () => _scrollToSection(_sectorsKey, 'categories'),
                  onServicesTap: () => _scrollToSection(_ideasKey, 'services'),
                  onPortfolioTap: () => _scrollToSection(_portfolioKey, 'portfolio'),
                  onWhyUsTap: () => _scrollToSection(_whyUsKey, 'whyUs'),
                  onContactTap: () => _scrollToSection(_contactKey, 'contact'),
                  activeSection: _activeSection,
                ),
              ),
              SliverToBoxAdapter(
                child: RepaintBoundary(child: IdeasWidget(key: _ideasKey)),
              ),
              SliverToBoxAdapter(
                child: RepaintBoundary(
                  child: SectorsWidget(key: _sectorsKey, sectors: state.sectors),
                ),
              ),
              SliverToBoxAdapter(
                child: RepaintBoundary(
                  child: PortfolioWidget(key: _portfolioKey, items: state.portfolioItems),
                ),
              ),
              SliverToBoxAdapter(
                child: RepaintBoundary(child: WhyUsWidget(key: _whyUsKey)),
              ),
              SliverToBoxAdapter(
                child: RepaintBoundary(child: ContactSectionWidget(key: _contactKey)),
              ),
              const SliverToBoxAdapter(child: FooterWidget()),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
