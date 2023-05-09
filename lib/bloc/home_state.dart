part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    Products? products,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(isLoading: false);
  }
}
