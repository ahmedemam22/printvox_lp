import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/content_item.dart';

abstract class LandingRepository {
  Future<Either<Failure, List<SectorItem>>> getSectors();
  Future<Either<Failure, List<PortfolioItem>>> getPortfolioItems();
  Future<Either<Failure, void>> submitContactForm(Map<String, dynamic> data);
}
