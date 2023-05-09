import 'package:bloc/bloc.dart';
import 'package:fakeapi/modals/modal.dart';
import 'package:fakeapi/repositary/repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    // on fetch api event
    on<_fetchApiEvent>((event, emit) async {
      emit(const HomeState(isLoading: true));
      final apiData = await Repositary.getProducts(event.context);
      emit(HomeState(isLoading: false, products: apiData));
    });
  }
}
