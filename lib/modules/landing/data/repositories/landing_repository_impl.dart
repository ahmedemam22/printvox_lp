import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/content_item.dart';
import '../../domain/repositories/landing_repository.dart';
import '../datasources/landing_remote_data_source.dart';

class LandingRepositoryImpl implements LandingRepository {
  final LandingRemoteDataSource remoteDataSource;

  LandingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SectorItem>>> getSectors() async {
    try {
      final result = await remoteDataSource.fetchSectors();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch sectors'));
    }
  }

  @override
  Future<Either<Failure, List<PortfolioItem>>> getPortfolioItems() async {
    try {
      final result = await remoteDataSource.fetchPortfolioItems();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch portfolio items'));
    }
  }

  @override
  Future<Either<Failure, void>> submitContactForm(Map<String, dynamic> data) async {
    try {
      await Future.delayed(const Duration(seconds: 1)); // Dummy send
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to submit form'));
    }
  }
}
