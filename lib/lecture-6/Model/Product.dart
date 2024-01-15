class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.isSelected});

  final int id;
  final String name;
  final int price;
  final bool isSelected;
}

List<Product> getProductsList() {
  return List.generate(
      200,
      (i) =>
          Product(id: i, name: "Name $i", price: (i + 100), isSelected: false));
}
