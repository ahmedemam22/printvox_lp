import 'package:equatable/equatable.dart';
import '../../domain/entities/content_item.dart';

abstract class LandingState extends Equatable {
  const LandingState();
  
  @override
  List<Object> get props => [];
}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingLoaded extends LandingState {
  final List<SectorItem> sectors;
  final List<PortfolioItem> portfolioItems;

  const LandingLoaded({
    required this.sectors,
    required this.portfolioItems,
  });

  @override
  List<Object> get props => [sectors, portfolioItems];
}

class LandingError extends LandingState {
  final String message;

  const LandingError({required this.message});

  @override
  List<Object> get props => [message];
}
