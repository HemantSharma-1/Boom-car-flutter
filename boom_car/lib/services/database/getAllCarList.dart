import 'package:boom_car/services/models/car_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cars.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cars (
        id TEXT PRIMARY KEY,
        brandName TEXT,
        model TEXT,
        variant TEXT,
        year INTEGER,
        carType TEXT,
        fuelType TEXT,
        transmission TEXT,
        seatCapacity INTEGER,
        pricing TEXT, 
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }

  Future<void> insertCar(CarIListModel car) async {
    final db = await database;
    await db.insert('cars', _convertCarToDb(car), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CarIListModel>> getCars() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cars');

    return List.generate(maps.length, (i) => _convertDbToCar(maps[i]));
  }

  Future<void> updateCar(CarIListModel car) async {
    final db = await database;
    await db.update(
      'cars',
      _convertCarToDb(car),
      where: 'id = ?',
      whereArgs: [car.id],
    );
  }

  Future<void> deleteAllCars() async {
    final db = await database;
    await db.delete('cars');
  }

  // Convert `CarIListModel` to Map for database
  Map<String, dynamic> _convertCarToDb(CarIListModel car) {
    return {
      'id': car.id,
      'brandName': car.brandName,
      'model': car.model,
      'variant': car.variant,
      'year': car.year,
      'carType': car.carType,
      'fuelType': car.fuelType,
      'transmission': car.transmission,
      'seatCapacity': car.seatCapacity,
      'pricing': jsonEncode(car.pricing?.toMap()), // Store Pricing as JSON string
      'createdAt': car.createdAt?.toIso8601String(),
      'updatedAt': car.updatedAt?.toIso8601String(),
    };
  }

  // Convert database Map to `CarIListModel`
  CarIListModel _convertDbToCar(Map<String, dynamic> map) {
    return CarIListModel(
      id: map['id'],
      brandName: map['brandName'],
      model: map['model'],
      variant: map['variant'],
      year: map['year'],
      carType: map['carType'],
      fuelType: map['fuelType'],
      transmission: map['transmission'],
      seatCapacity: map['seatCapacity'],
      pricing: map['pricing'] != null ? Pricing.fromMap(jsonDecode(map['pricing'])) : null,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }
}
