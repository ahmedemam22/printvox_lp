import 'package:equatable/equatable.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object> get props => [];
}

class FetchLandingData extends LandingEvent {}

class SubmitForm extends LandingEvent {
  final Map<String, dynamic> data;

  const SubmitForm(this.data);

  @override
  List<Object> get props => [data];
}
