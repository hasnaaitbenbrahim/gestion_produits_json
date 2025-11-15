
import 'package:uuid/uuid.dart';
import '../models/product.dart';
import '../services/product_service.dart';
class ProductController {
final ProductService _service = ProductService();
final List<Product> _products = [];
List<Product> get products => List.unmodifiable(_products);
Future<void> loadProducts() async {
_products.clear();
_products.addAll(await _service.loadProducts());
}
Future<void> addProduct(String name, double price, int stock, String desc) async {
final product = Product(
id: const Uuid().v4(),
name: name,
price: price,
stock: stock,
description: desc,
);
_products.add(product);
await _service.saveProducts(_products);
}

Future<void> deleteProduct(String id) async {
_products.removeWhere((p) => p.id == id);
await _service.saveProducts(_products);
}
}