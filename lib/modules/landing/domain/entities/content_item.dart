import 'package:equatable/equatable.dart';

class PortfolioItem extends Equatable {
  final String id;
  final String title;
  final String category;
  final String imageUrl;

  const PortfolioItem({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, category, imageUrl];
}

class SectorItem extends Equatable {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;

  const SectorItem({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, subTitle, imageUrl];
}
