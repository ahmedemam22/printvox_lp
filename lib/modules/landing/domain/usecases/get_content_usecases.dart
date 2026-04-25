import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/content_item.dart';
import '../repositories/landing_repository.dart';

class GetSectorsUseCase implements UseCase<List<SectorItem>, NoParams> {
  final LandingRepository repository;
  GetSectorsUseCase(this.repository);

  @override
  Future<Either<Failure, List<SectorItem>>> call(NoParams params) async {
    return await repository.getSectors();
  }
}

class GetPortfolioUseCase implements UseCase<List<PortfolioItem>, NoParams> {
  final LandingRepository repository;
  GetPortfolioUseCase(this.repository);

  @override
  Future<Either<Failure, List<PortfolioItem>>> call(NoParams params) async {
    return await repository.getPortfolioItems();
  }
}
