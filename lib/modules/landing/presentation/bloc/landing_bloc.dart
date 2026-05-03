import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printvox_lp/core/usecases/usecase.dart';
import 'package:printvox_lp/modules/landing/domain/usecases/get_content_usecases.dart';
import 'package:printvox_lp/modules/landing/domain/usecases/submit_contact_form_usecase.dart';
import 'package:printvox_lp/modules/landing/presentation/bloc/landing_event.dart';
import 'package:printvox_lp/modules/landing/presentation/bloc/landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final GetSectorsUseCase getSectorsUseCase;
  final GetPortfolioUseCase getPortfolioUseCase;
  final SubmitContactFormUseCase submitContactFormUseCase;

  LandingBloc({
    required this.getSectorsUseCase,
    required this.getPortfolioUseCase,
    required this.submitContactFormUseCase,
  }) : super(LandingInitial()) {
    on<FetchLandingData>(_onFetchLandingData);
    on<SubmitForm>(_onSubmitForm);
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

  Future<void> _onSubmitForm(
    SubmitForm event,
    Emitter<LandingState> emit,
  ) async {

    
    emit(FormSubmitting());

    final result = await submitContactFormUseCase(event.data);

    result.fold(
      (failure) => emit(FormError(message: failure.message)),
      (_) => emit(FormSubmitted()),
    );

    // If we were in a loaded state, we might want to return to it
    // But for now, the UI will handle the success/error dialogs based on these states.
  }
}
