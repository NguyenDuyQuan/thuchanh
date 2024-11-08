class Product {
  final String id;
  final String size;
  final String name;
  final double price;
  final String image;
  int quantity;

   Product({
    required this.id,
    required this.size,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}
