import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "../bloc/home_bloc.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeEvent.fetchApiEvent(context: context));
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }

            if (state.products != null) {
              return const Center(
                  child: Text(
                "<< Items found >>",
                style: TextStyle(color: Colors.yellow),
              ));
            } else {
              return const SizedBox(width: 1);
            }
          },
        ));
  }
}
