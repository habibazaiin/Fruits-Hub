class AddProductInputEntity {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final String productImage;
  final String? urlImage;
  AddProductInputEntity({
    this.urlImage,
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.productImage,
  });
}
