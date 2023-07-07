class Products {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  factory Products.empty() {
    return Products(
      id: 0,
      title: 'no-data',
      price: '0',
      description: '',
      category: '',
      image: '',
    );
  }
}
