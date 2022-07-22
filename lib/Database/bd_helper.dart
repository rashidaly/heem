import 'package:heem/models/cart_review.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _oncreate);
    return db;
  }

  _oncreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE cart (id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER, productPrice INTEGER, quantity INTEGER, cartDescription TEXT, image TEXT)'
    );
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
     await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future <int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete('cart',
    where: 'id = ?',
      whereArgs: [id]
    );
  }
  Future<int> updateQuanitity(Cart cart) async{
    var dbClient = await db;
    return await dbClient!.update('cart',
        cart.toMap(),
      where: 'id = ?',
      whereArgs: [cart.id]
    );

  }
 }
