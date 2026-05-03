import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/landing_repository.dart';

class SubmitContactFormUseCase implements UseCase<void, Map<String, dynamic>> {
  final LandingRepository repository;

  SubmitContactFormUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    return await repository.submitContactForm(params);
  }
}
