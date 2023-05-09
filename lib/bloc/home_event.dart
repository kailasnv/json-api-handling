part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchApiEvent({
    required BuildContext context,
  }) = _fetchApiEvent;
}
