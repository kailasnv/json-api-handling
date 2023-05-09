import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // calling events ..
    BlocProvider.of<HomeBloc>(context).add(const FetchApiEvent());

    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(backgroundColor: Colors.deepPurple),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.products != null) {
              return ListView.builder(
                itemCount: state.products!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(state.products![index].title),
                          Image.network(
                            state.products![index].image,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(state.products![index].description),
                          Text(
                              " Price : ${state.products![index].price.toString()} \$ ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                  child: Text("No items Found",
                      style: TextStyle(color: Colors.yellow)));
            }
          },
        ));
  }
}
