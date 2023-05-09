import 'package:freezed_annotation/freezed_annotation.dart';

part 'modal.freezed.dart';
part 'modal.g.dart';

@freezed
class Products with _$Products {
  const factory Products({
    required List<Data>? modalList,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}

// this below is the actual modal class
@freezed
class Data with _$Data {
  const factory Data({
    required int? id,
    required String? title,
    required String? description,
    required num? price,
    required String? image,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
