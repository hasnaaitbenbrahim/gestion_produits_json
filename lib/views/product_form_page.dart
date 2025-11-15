
import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
class ProductFormPage extends StatefulWidget {
final ProductController controller;
const ProductFormPage({required this.controller, super.key});
@override
State<ProductFormPage> createState() => _ProductFormPageState();
}
class _ProductFormPageState extends State<ProductFormPage> {
final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _priceController = TextEditingController();
final _stockController = TextEditingController();
final _descController = TextEditingController();
void _save() async {
  if (!_formKey.currentState!.validate()) return;
await widget.controller.addProduct(
_nameController.text,
double.parse(_priceController.text),
int.parse(_stockController.text),
_descController.text,
);
Navigator.pop(context);
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Ajouter un produit')),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Form(
key: _formKey,
child: Column(
children: [
TextFormField(
controller: _nameController,
decoration: const InputDecoration(labelText: 'Nom du produit'),
validator: (v) => v!.isEmpty ? 'Nom requis' : null,
),
TextFormField(
controller: _priceController,
decoration: const InputDecoration(labelText: 'Prix'),
keyboardType: TextInputType.number,
validator: (v) => v!.isEmpty ? 'Prix requis' : null,
),
TextFormField(
controller: _stockController,
decoration: const InputDecoration(labelText: 'Stock'),
keyboardType: TextInputType.number,
validator: (v) => v!.isEmpty ? 'Stock requis' : null,
),
TextFormField(
controller: _descController,
decoration: const InputDecoration(labelText: 'Description'),
),
const SizedBox(height: 20),
ElevatedButton(onPressed: _save, child: const Text('Enregistrer')),
],
),
),
),
);
}
}