import 'package:rentaroo/database/database_initialization.dart';
import 'package:rentaroo/models/furniture_model.dart';
import 'package:rentaroo/models/rent_detail_model.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'my_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Furniture(
            id_furniture INTEGER PRIMARY KEY,
            category TEXT,
            description TEXT,
            stock INTEGER,
            price REAL,
            image TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE Rent (
            id_rent INTEGER PRIMARY KEY,
            title TEXT,
            start_date TEXT,
            due_date TEXT,
            reminder_date TEXT,
            state TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE Rent_Detail(
            id_detail INTEGER PRIMARY KEY,
            id_rent INTEGER,
            id_furniture INTEGER,
            quantity INTEGER,
            FOREIGN KEY (id_rent) REFERENCES Rent(id_rent),
            FOREIGN KEY (id_furniture) REFERENCEs Furniture(id_furniture)
          )
        ''');

        // Insertar datos predeterminados
        await initializeDatabase(db);
      },
      version: 1,
    );
  }

  // CRUD Furniture
  // Método para insertar
  Future<void> insertFurniture(Furniture furniture) async {
    final db = await _initDatabase();
    await db.insert('Furniture', furniture.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Método para leer
  Future<List<Furniture>> getAllFurniture() async {
    Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Furniture');
    return List.generate(maps.length, (index) {
      return Furniture(
        id: maps[index]['id_furniture'],
        category: maps[index]['category'],
        description: maps[index]['description'],
        stock: maps[index]['stock'],
        price: maps[index]['price'],
        image: maps[index]['image'],
      );
    });
  }

  // Método para recuperar mobiliario por cagtegoria
  Future<List<Furniture>> getAllFurnitureByCategory(String category) async {
    Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db
        .query('Furniture', where: 'category = ?', whereArgs: [category]);
    return List.generate(maps.length, (index) {
      return Furniture(
        id: maps[index]['id_furniture'],
        category: maps[index]['category'],
        description: maps[index]['description'],
        stock: maps[index]['stock'],
        price: maps[index]['price'],
        image: maps[index]['image'],
      );
    });
  }

  // Método para actualizar
  Future<void> updateFurniture(Furniture furniture) async {
    final db = await _initDatabase();
    await db.update(
      'Furniture',
      furniture.toMap(),
      where: 'id_furniture = ?',
      whereArgs: [furniture.id],
    );
  }

  // Método para eliminar
  Future<void> deleteFurniture(int id) async {
    final db = await _initDatabase();
    await db.delete(
      'Furniture',
      where: 'id_furniture = ?',
      whereArgs: [id],
    );
  }

  // CRUD Rent
  // Insertar Renta
  Future<void> insertRent(Rent rent) async {
    final db = await _initDatabase();
    await db.insert('Rent', rent.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Obtener Rentas
  Future<List<Rent>> getAllRents() async {
    final db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Rent');
    return List.generate(maps.length, (index) {
      return Rent(
          id: maps[index]['id_rent'],
          title: maps[index]['title'],
          startDate: DateTime.parse(maps[index]['start_date']),
          dueDate: DateTime.parse(maps[index]['due_date']),
          reminderDate: DateTime.parse(maps[index]['reminder_date']),
          state: maps[index]['state']);
    });
  }

  // Actualizar Renta
  Future<void> updateRent(Rent rent) async {
    final db = await _initDatabase();
    await db.update(
      'Rent',
      rent.toMap(),
      where: 'id_rent = ?',
      whereArgs: [rent.id],
    );
  }

  // Eliminar Renta
  Future<void> deleteRent(int id) async {
    final db = await _initDatabase();
    await db.delete(
      'Rent',
      where: 'id_rent = ?',
      whereArgs: [id],
    );
  }

  // CRUD Rent_Detail
  // Insertar Detalle de renta
  Future<void> insertRentDetail(RentDetail rentDetail) async {
    final db = await _initDatabase();
    await db.insert('Rent_Detail', rentDetail.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Obtener Detalle de renta
  Future<List<RentDetail>> getAllRentDetails() async {
    final db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Rent_Detail');
    return List.generate(maps.length, (index) {
      return RentDetail(
        id: maps[index]['id_detail'],
        rentId: maps[index]['id_rent'],
        furnitureId: maps[index]['id_furniture'],
        quantity: maps[index]['quantity'],
      );
    });
  }

  // Actualizar Detalle de renta
  Future<void> updateRentDetail(RentDetail rentDetail) async {
    final db = await _initDatabase();
    await db.update(
      'Rent_Detail',
      rentDetail.toMap(),
      where: 'id_detail = ?',
      whereArgs: [rentDetail.id],
    );
  }

  // Eliminar Detalle de renta
  Future<void> deleteRentDetail(int id) async {
    final db = await _initDatabase();
    await db.delete(
      'Rent_Detail',
      where: 'id_detail = ?',
      whereArgs: [id],
    );
  }
}
