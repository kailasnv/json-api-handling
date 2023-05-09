// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:fakeapi/modals/modal.dart';
import 'package:fakeapi/modals/poduct_modal.dart';
import 'package:fakeapi/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Repositary {
  static Future<Products?> getProducts(BuildContext context) async {
    try {
      // fetching api
      const String URL = "https://fakestoreapi.com/products";
      final uri = Uri.parse(URL);
      final response = await http.get(uri);
      print("STATUS CODE : ${response.statusCode}");
      //
      if (response.statusCode == 200) {
        /// final jsonData = jsonDecode(response.body);
        //  print("RESPONSE >> ${response.body.toString()}");

        final _products =
            Products.fromJson(response.body as Map<String, dynamic>);
        return _products;
      } else {
        throw Exception();
      }

      //
    } catch (e) {
      print("Network Error  : $e");
      PopUps()
          .showErrorMessage(context, e.toString()); // this shows  a snackbar
    }
  }
}
