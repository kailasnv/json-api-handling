import 'package:freezed_annotation/freezed_annotation.dart';

part 'modal.freezed.dart';
part 'modal.g.dart';

@freezed
class ProductModal with _$ProductModal {
  const factory ProductModal({
    required int id,
    required String title,
    required String description,
    required num price,
    required String image,
  }) = _ProductModal;

  factory ProductModal.fromJson(Map<String, dynamic> json) =>
      _$ProductModalFromJson(json);
}
