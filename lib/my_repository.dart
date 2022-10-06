import 'package:flutter/material.dart';

import 'db/cashed_todo.dart';
import 'db/local_database.dart';
import 'model/category_model.dart';
import 'model/todo_model.dart';

class MyRepository {
  static final MyRepository _instance = MyRepository._();

  factory MyRepository() {
    return _instance;
  }

  MyRepository._();

  static List<CategoryModel> categories = [
    CategoryModel(
      categoryName: "Work",
      categoryColor: Colors.green,
      categoryId: 1,
      iconPath: Icons.work,
    ),
    CategoryModel(
      categoryName: "Sport",
      categoryColor: Colors.blue,
      categoryId: 2,
      iconPath: Icons.sports_basketball,
    ),
    CategoryModel(
      categoryName: "Health",
      categoryColor: Colors.red,
      categoryId: 3,
      iconPath: Icons.favorite_outlined,
    ),
    CategoryModel(
      categoryName: "Food",
      categoryColor: Colors.yellow,
      categoryId: 4,
      iconPath: Icons.fastfood,
    ),
    CategoryModel(
      categoryName: "Coding",
      categoryColor: Colors.black,
      categoryId: 5,
      iconPath: Icons.code,
    )
  ];

  static List<TodoModel> myTodos = [
    TodoModel(
      categoryId: 5,
      dateTime: "2022-07-28 21:50:32.557848",
      isDone: false,
      todoDescription:
      "Learning SQL database requests, Yaxshilab o'rganishim kerak, darsga tayyorlanib borishim shart, Men ikkichi emasman!",
      todoTitle: "SQL",
      urgentLevel: 4,
    ),
    TodoModel(
      categoryId: 1,
      dateTime: "2022-07-26 21:50:32.557848",
      isDone: true,
      todoDescription: "Mettingda qatnashishim kerak",
      todoTitle: "Work",
      urgentLevel: 3,
    )
  ];

  static void addTodoToDone(TodoModel todoModel) {
    for (int i = 0; i < myTodos.length; i++) {
      if (myTodos[i] == todoModel) {
        myTodos[i].isDone = true;
      }
    }
  }

  static void addNewTodo({required TodoModel todoModel}) {
    myTodos.add(todoModel);
  }

  // static Future<CachedTodo> insertCachedTodo(
  //     {required CachedTodo cachedTodo}) async {
  //   var isEqual = LocalDatabase.getInstance==LocalDatabase();
  //   print(isEqual);
  //   return await LocalDatabase.insertCachedTodo(cachedTodo);
  // }
  //
  // static Future<List<CachedTodo>> getAllCachedTodos() async {
  //   return await LocalDatabase.getAllCachedTodos();
  // }

  // static Future<CachedUser>insertCachedUser({
  // required CachedUser cachedUser}) async{
  //   return await LocalDatabase.insertCachedUser(cachedUser);
  // }
  // static Future<List<CachedUser>>getAllCashedUser() async{
  //   return await LocalDatabase.getAllCachedUser();
  // }
  //
  // static Future<int> deleteAllCachedUsers() async {
  //   final db = await LocalDatabase.deleteAllCachedUsers();
  //   return await db.delete(tableName2);
  // }
  // static Future<int> deleteCachedUserById(int id) async {
  //   final db = await getInstance.database;
  //   var t = await db
  //       .delete(tableName2, where: "${CachedUserFields.id}=?", whereArgs: [id]);
  //   if (t > 0) {
  //     return t;
  //   } else {
  //     return -1;
  //   }
  // }
  // static Future<int> updateCachedUser(CachedUser cachedUser) async {
  //   Map<String, dynamic> row = {
  //     CachedUserFields.name: cachedUser.name,
  //     CachedUserFields.age: cachedUser.age,
  //   };
  //
  //   final db = await getInstance.database;
  //   return await db.update(
  //     tableName,
  //     row,
  //     where: '${CachedUserFields.id} = ?',
  //     whereArgs: [cachedUser.id],
  //   );
  // }

}