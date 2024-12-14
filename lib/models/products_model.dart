class Product{
  final int id;
  final String name;
  final String description;
  final String img;
  final int stars;
  final String rate;
  final String comment;
  final String type;
  final String location;
  final String min;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.name ,
    required this.description,
    required this.img,
    required this.stars,
    required this.rate,
    required this.comment,
    required this.type,
    required this.location,
    required this.min,
    required this.price,
    required this.quantity
});
}