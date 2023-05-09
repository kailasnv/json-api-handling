part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    List<ProductModal>? products,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(isLoading: false);
}
