import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/apis.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/content_item.dart';

abstract class LandingRemoteDataSource {
  Future<List<SectorItem>> fetchSectors();
  Future<List<PortfolioItem>> fetchPortfolioItems();
  Future<void> submitContactForm(Map<String, dynamic> data);
}

class LandingRemoteDataSourceImpl implements LandingRemoteDataSource {
  @override
  Future<List<SectorItem>> fetchSectors() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const SectorItem(
        id: '1',
        title: 'المطاعم والكافيهات',
        subTitle: 'Restaurants & Cafes',
        imageUrl: 'assets/images/restaurant_bg.png',
      ),
      const SectorItem(
        id: '2',
        title: 'المخابز والحلويات',
        subTitle: 'Bakery & Sweets',
        imageUrl: 'assets/images/bakery_bg.png',
      ),
      const SectorItem(
        id: '3',
        title: 'المدارس والجامعات',
        subTitle: 'Schools & Universities',
        imageUrl: 'assets/images/school_bg.png',
      ),
      const SectorItem(
        id: '4',
        title: 'الشركات والمؤسسات',
        subTitle: 'Corporates & Offices',
        imageUrl: 'assets/images/company_bg.png',
      ),
      const SectorItem(
        id: '5',
        title: 'المصانع والخدمات',
        subTitle: 'Factories & Services',
        imageUrl: 'assets/images/factory_bg.png',
      ),
      const SectorItem(
        id: '6',
        title: 'العناية ومستحضرات التجميل',
        subTitle: 'Cosmetics & Beauty',
        imageUrl: 'assets/images/cosmetics_bg.png',
      ),
      const SectorItem(
        id: '7',
        title: 'الملابس والأزياء',
        subTitle: 'Clothing & Fashion',
        imageUrl: 'assets/images/clothing_bg.png',
      ),
    ];
  }

  @override
  Future<List<PortfolioItem>> fetchPortfolioItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      /// 📦 PACKAGING
      const PortfolioItem(
        id: 'pk1',
        title: 'Premium Box',
        category: 'Packaging',
        imageUrl: 'assets/images/packaging/mockup_1.png',
      ),
      const PortfolioItem(
        id: 'pk2',
        title: 'Mailing Box',
        category: 'Packaging',
        imageUrl: 'assets/images/packaging/mockup_2.png',
      ),
      const PortfolioItem(
        id: 'pk3',
        title: 'Gift Bag',
        category: 'Packaging',
        imageUrl: 'assets/images/packaging/mockup_3.png',
      ),
      const PortfolioItem(
        id: 'pk4',
        title: 'Display Box',
        category: 'Packaging',
        imageUrl: 'assets/images/packaging/mockup_4.png',
      ),
      const PortfolioItem(
        id: 'pk5',
        title: 'Subscription Box',
        category: 'Packaging',
        imageUrl: 'assets/images/packaging/mockup_5.png',
      ),

      /// 🎨 BRANDING
      const PortfolioItem(
        id: 'br6',
        title: 'Stationery Set',
        category: 'Branding',
        imageUrl: 'assets/images/branding/mockup_6.png',
      ),
      const PortfolioItem(
        id: 'br7',
        title: 'Brand Identity',
        category: 'Branding',
        imageUrl: 'assets/images/branding/mockup_7.png',
      ),
      const PortfolioItem(
        id: 'br8',
        title: 'Logo Mockup',
        category: 'Branding',
        imageUrl: 'assets/images/branding/mockup_8.png',
      ),
      const PortfolioItem(
        id: 'br9',
        title: 'Corporate Identity',
        category: 'Branding',
        imageUrl: 'assets/images/branding/mockup_9.png',
      ),
      const PortfolioItem(
        id: 'br10',
        title: 'Brand Manual',
        category: 'Branding',
        imageUrl: 'assets/images/branding/mockup_10.png',
      ),

      /// 🖨 PRINT
      const PortfolioItem(
        id: 'pr11',
        title: 'Brochures',
        category: 'Print',
        imageUrl: 'assets/images/printing/mockup_11.png',
      ),
      const PortfolioItem(
        id: 'pr12',
        title: 'Books',
        category: 'Print',
        imageUrl: 'assets/images/printing/mockup_12.png',
      ),
      const PortfolioItem(
        id: 'pr13',
        title: 'Labels',
        category: 'Print',
        imageUrl: 'assets/images/printing/mockup_13.png',
      ),
      const PortfolioItem(
        id: 'pr14',
        title: 'Menu Design',
        category: 'Print',
        imageUrl: 'assets/images/printing/mockup_14.png',
      ),
      const PortfolioItem(
        id: 'pr15',
        title: 'Stationery Print',
        category: 'Print',
        imageUrl: 'assets/images/printing/mockup_15.png',
      ),

      /// 📢 LARGE FORMAT
      const PortfolioItem(
        id: 'lf16',
        title: 'Rollup Banner',
        category: 'Large Format',
        imageUrl: 'assets/images/large_format/mockup_16.png',
      ),
      const PortfolioItem(
        id: 'lf17',
        title: 'Wall Graphics',
        category: 'Large Format',
        imageUrl: 'assets/images/large_format/mockup_17.png',
      ),
      const PortfolioItem(
        id: 'lf18',
        title: 'Exhibition Stand',
        category: 'Large Format',
        imageUrl: 'assets/images/large_format/mockup_18.png',
      ),
      const PortfolioItem(
        id: 'lf19',
        title: 'Outdoor Signage',
        category: 'Large Format',
        imageUrl: 'assets/images/large_format/mockup_19.png',
      ),
      const PortfolioItem(
        id: 'lf20',
        title: 'Billboard Mockup',
        category: 'Large Format',
        imageUrl: 'assets/images/large_format/mockup_20.png',
      ),
    ];
  }

  @override
  Future<void> submitContactForm(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(AppApi.googleSheetsUrl),
      headers: {
        // We use text/plain to bypass CORS pre-flight checks on Flutter Web
        "Content-Type": "text/plain",
      },
      body: jsonEncode({
        "name": data["name"],
        "phone": data["phone"],
        "details": data["details"],
      }),
    );

    if (response.statusCode >= 400) {
      throw ServerException('Failed to submit form');
    }
  }
}
