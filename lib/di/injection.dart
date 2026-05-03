import 'package:get_it/get_it.dart';
import 'package:printvox_lp/modules/landing/data/datasources/landing_remote_data_source.dart';
import 'package:printvox_lp/modules/landing/data/repositories/landing_repository_impl.dart';
import 'package:printvox_lp/modules/landing/domain/repositories/landing_repository.dart';
import 'package:printvox_lp/modules/landing/domain/usecases/get_content_usecases.dart';
import 'package:printvox_lp/modules/landing/domain/usecases/submit_contact_form_usecase.dart';
import 'package:printvox_lp/modules/landing/presentation/bloc/landing_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Landing
  
  // Bloc
  sl.registerFactory(() => LandingBloc(
    getSectorsUseCase: sl(),
    getPortfolioUseCase: sl(),
    submitContactFormUseCase: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetSectorsUseCase(sl()));
  sl.registerLazySingleton(() => GetPortfolioUseCase(sl()));
  sl.registerLazySingleton(() => SubmitContactFormUseCase(sl()));

  // Repository
  sl.registerLazySingleton<LandingRepository>(
    () => LandingRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<LandingRemoteDataSource>(
    () => LandingRemoteDataSourceImpl(),
  );
}
