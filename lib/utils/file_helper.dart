
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class FileHelper {
static const _fileName = 'products.json';
static Future<File> _getLocalFile() async {
final dir = await getApplicationDocumentsDirectory();
final file = File('${dir.path}/$_fileName');
// Création du fichier s’il n’existe pas encore
if (!await file.exists()) {
await file.writeAsString(jsonEncode([]));
}
return file;
}
// Lecture du contenu JSON
static Future<List<dynamic>> readJsonFile() async {
final file = await _getLocalFile();
final content = await file.readAsString();
return jsonDecode(content);
}
// Écriture dans le fichier JSON
static Future<void> writeJsonFile(List<dynamic> data) async {
final file = await _getLocalFile();
await file.writeAsString(jsonEncode(data));
}
}