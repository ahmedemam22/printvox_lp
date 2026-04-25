import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_content_usecases.dart';
import 'landing_event.dart';
import 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final GetSectorsUseCase getSectorsUseCase;
  final GetPortfolioUseCase getPortfolioUseCase;

  LandingBloc({
    required this.getSectorsUseCase,
    required this.getPortfolioUseCase,
  }) : super(LandingInitial()) {
    on<FetchLandingData>(_onFetchLandingData);
  }

  Future<void> _onFetchLandingData(
    FetchLandingData event,
    Emitter<LandingState> emit,
  ) async {
    emit(LandingLoading());

    final sectorsEither = await getSectorsUseCase(NoParams());
    final portfolioEither = await getPortfolioUseCase(NoParams());

    sectorsEither.fold(
      (failure) => emit(LandingError(message: failure.message)),
      (sectors) {
        portfolioEither.fold(
          (failure) => emit(LandingError(message: failure.message)),
          (portfolioItems) => emit(LandingLoaded(
            sectors: sectors,
            portfolioItems: portfolioItems,
          )),
        );
      },
    );
  }
}
