import 'package:fakapi/modals/poduct_modal.dart';
import "package:flutter/material.dart";
import 'package:fakapi/repositary/repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // some variables
  bool isLoaded = false;
  List<ProductModal>? productLists = [];

  Future getData() async {
    productLists = await Repositary.getProducts(context);

    if (productLists != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: productLists!.length,
          itemBuilder: (context, index) {
            if (productLists != null) {
              return Container(
                width: double.infinity,
                height: 250,
                child: Column(
                  children: [
                    Text(productLists![index].title),
                    Image.network(
                      productLists![index].image,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(productLists![index].price.toString()),
                  ],
                ),
              );
            } else {
              return const Center(
                  child: Text(
                "NO ITEMS FOUND",
                style: TextStyle(color: Colors.yellow),
              ));
            }
          },
        ),
      ),
    );
  }
}
