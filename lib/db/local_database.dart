import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'cashed_todo.dart';

// class LocalDatabase {
//   static final LocalDatabase getInstance = LocalDatabase._init();
//
//   static Database? _database;
//
//   factory LocalDatabase() {
//     return getInstance;
//   }
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       _database = await _initDB("todos.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
//     const textType = "TEXT NOT NULL";
//     const intType = "INTEGER DEFAULT 0";
//
//     await db.execute('''
//     CREATE TABLE $tableName (
//     ${CachedTodoFields.id} $idType,
//     ${CachedTodoFields.categoryId} $intType,
//     ${CachedTodoFields.dateTime} $textType,
//     ${CachedTodoFields.isDone} $intType,
//     ${CachedTodoFields.todoDescription} $textType,
//     ${CachedTodoFields.todoTitle} $textType,
//     ${CachedTodoFields.urgentLevel} $intType
//     )
//     ''');
//   }
//
//   LocalDatabase._init();
//
//   //-------------------------------------------Cached Todos Table------------------------------------
//
//   static Future<CachedTodo> insertCachedTodo(CachedTodo cachedTodo) async {
//     final db = await getInstance.database;
//     final id = await db.insert(tableName, cachedTodo.toJson());
//     return cachedTodo.copyWith(id: id);
//   }
//
//   static Future<List<CachedTodo>> getAllCachedTodos() async {
//     final db = await getInstance.database;
//     const orderBy = '${CachedTodoFields.todoTitle} DESC';
//     final result = await db.query(tableName, orderBy: orderBy);
//     return result.map((json) => CachedTodo.fromJson(json)).toList();
//   }
// }












class LocalDatabase{
  static final LocalDatabase getInstance=LocalDatabase._init();

  static Database?_database;

  factory LocalDatabase(){
    return getInstance;
  }

  Future<Database> get database async{
    if(_database!=null){
      return _database!;
    }else {
      _database =await _initDB("user.db");
      return _database!;
    }
  }
  Future<Database> _initDB(String filePath) async{
    final dbPath= await getDatabasesPath();
    final path= join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  Future _createDB(Database db, int version) async{
    const idType="INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType="TEXT NOT NULL";
    const intType="INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE $tableName2(
    ${CachedUserFields.id} $idType,
    ${CachedUserFields.age} $intType,
    ${CachedUserFields.name} $textType
    )
    ''');
  }

  LocalDatabase._init();
//----------------------------------Cached Users Table------------------

  static Future<CachedUser> insertCachedUser(CachedUser cachedUser)async{
    final db= await getInstance.database;
    final id =await db.insert(tableName2, cachedUser.toJson());
    return cachedUser.copyWith(id: id);
  }

  static Future<List<CachedUser>> getAllCachedUser()async{
    final db= await getInstance.database;
    const orderBy= "${CachedUserFields.name} ASC";
    final result =await db.query(tableName2, orderBy: orderBy);
    return result.map((json) => CachedUser.fromJson(json)).toList();
  }

  static Future<int> deleteAllCachedUsers() async {
    final db = await getInstance.database;
    return await db.delete(tableName2);
  }
  static Future<int> deleteCachedUserById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(tableName2, where: "${CachedUserFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }
  static Future<int> updateCachedUser(CachedUser cachedUser) async {
    Map<String, dynamic> row = {
      CachedUserFields.name: cachedUser.name,
      CachedUserFields.age: cachedUser.age,
    };

    final db = await getInstance.database;
    return await db.update(
      tableName,
      row,
      where: '${CachedUserFields.id} = ?',
      whereArgs: [cachedUser.id],
    );
  }


}