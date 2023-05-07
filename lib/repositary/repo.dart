import 'dart:convert';

import 'package:fakapi/modals/poduct_modal.dart';
import 'package:fakapi/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Repositary {
  static Future<List<ProductModal>?> getProducts(BuildContext context) async {
    // list of modals
    List<ProductModal> ProductList = [];
    try {
      // fetching api
      const String URL = "https://fakestoreapi.com/products";
      final uri = Uri.parse(URL);
      final response = await http.get(uri);
      print("STATUS CODE : ${response.statusCode}");
      //
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        for (var eachItem in jsonData) {
          final modal = ProductModal.fromJson(eachItem);
          ProductList.add(modal);
        }
        print("LENGTH OF ITEMS >> ${ProductList.length}");
        return ProductList;
      }
    } catch (e) {
      print("Network Error  : $e");
      PopUps().showErrorMessage(context, e.toString());
    }
  }
}
