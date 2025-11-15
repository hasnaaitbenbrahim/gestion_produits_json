

class Product {
String id;
String name;
double price;
int stock;
String description;
Product({
required this.id,
required this.name,
required this.price,
required this.stock,
required this.description,
});

// Conversion JSON → Objet
factory Product.fromJson(Map<String, dynamic> json) => Product(
id: json['id'],
name: json['name'],
price: (json['price'] as num).toDouble(),
stock: (json['stock'] as num).toInt(),
description: json['description'] ?? '',
);
// Conversion Objet → JSON
Map<String, dynamic> toJson() => {
'id': id,
'name': name,
'price': price,
'stock': stock,
'description': description,
};
}
