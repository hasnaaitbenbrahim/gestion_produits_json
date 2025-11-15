
import '../models/product.dart';
import '../utils/file_helper.dart';
class ProductService {
Future<List<Product>> loadProducts() async {
final data = await FileHelper.readJsonFile();
return data.map((e) => Product.fromJson(e)).toList();
}
Future<void> saveProducts(List<Product> products) async {
final data = products.map((p) => p.toJson()).toList();
await FileHelper.writeJsonFile(data);
}
}