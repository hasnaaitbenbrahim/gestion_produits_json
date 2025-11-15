
import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import 'product_form_page.dart';
class ProductListPage extends StatefulWidget {
const ProductListPage({super.key});
@override
State<ProductListPage> createState() => _ProductListPageState();
}
class _ProductListPageState extends State<ProductListPage> {
final ProductController controller = ProductController();
bool _loading = true;
@override
void initState() {
super.initState();
controller.loadProducts().then((_) => setState(() => _loading = false));
}
void _openForm() async {
await Navigator.push(
context,
MaterialPageRoute(builder: (_) => ProductFormPage(controller: controller)),
);
setState(() {});
}
void _delete(String id) async {
await controller.deleteProduct(id);
setState(() {});
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Liste des produits')),
body: _loading
? const Center(child: CircularProgressIndicator())
: ListView(
children: controller.products
.map((p) => ListTile(
title: Text(p.name),
subtitle: Text('Prix: ${p.price} • Stock: ${p.stock}'),
trailing: IconButton(
  icon: const Icon(Icons.delete),
onPressed: () => _delete(p.id),
),
))
.toList(),
),
floatingActionButton: FloatingActionButton(
onPressed: _openForm,
child: const Icon(Icons.add),
),
);
}
}