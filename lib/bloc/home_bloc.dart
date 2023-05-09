// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:fakeapi/repositary/repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../modals/modal.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    // on events
    on<FetchApiEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final _apiData = await Repositary.getProducts();
      emit(state.copyWith(isLoading: false, products: _apiData));
    });
  }
}
