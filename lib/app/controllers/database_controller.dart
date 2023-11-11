import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:list_of_words/list_of_words.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:list_of_words/list_of_words.dart';

class DatabaseController extends GetxController {
  Database? db;

//cette partie ne se lance par automatiquement...????
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "asset_database.db");

    //on repart de la base de donnée dans asset si on est en debug sinon on garde la base de donnée en local si elle existe
    if (kDebugMode ||
        FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      print('initialisation de la database');
      ByteData data = await rootBundle.load(join('assets', 'database.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_database.db');
    this.db = await sqlite3.open(databasePath);
  }

  Future<List<Map<String, dynamic>>> select(String champ) async {
    List<Map<String, dynamic>> maps =
        await db!.select('SELECT * FROM ' + champ);
    return maps;
  }

  Future<int> insert(String tableName, Map<String, dynamic> row) async {
    final fieldName = row.keys.first;
    final stmt = db!.prepare('INSERT INTO $tableName ($fieldName) VALUES (?)');
    stmt.execute([row[fieldName]]);
    stmt.dispose();
    return 1;
  }

  Future testinsert(String champ) async {
    await insert('categories',
        {"nom": french_nouns.elementAt(Random().nextInt(french_nouns.length))});
  }
}
