import 'package:sqflite/sqflite.dart';

Future<void> initializeDatabase(Database db) async {
  // Insertar datos predeterminados en la tabla Furniture
  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Descripción de la silla',
    'stock': 10,
    'price': 50.00
  });
  await db.insert('Furniture', {
    'category': 'Mesas',
    'description': 'Descripción de la mesa',
    'stock': 5,
    'price': 100.89
  });

  // Insertar datos predeterminados en la tabla rent
  await db.insert('Rent', {
    'start_date': DateTime.now().toIso8601String(),
    'due_date': DateTime.now().toIso8601String(),
    'reminder_date': DateTime.now().toIso8601String(),
    'state': 'En proceso'
  });
}
