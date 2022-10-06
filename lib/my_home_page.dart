import 'package:flutter/material.dart';
import 'package:sql_with_use/db/local_database.dart';

import 'db/cashed_todo.dart';
import 'my_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime = DateTime.now();
 // List<CachedTodo> cachedTodos = [];
List<CachedUser> cachedUser=[];
  Future<void> _init() async {
    cachedUser = await LocalDatabase.getAllCachedUser();
    setState((){});

  }

  @override
  initState() {
    _init();
    super.initState();
  }

  Future<DateTime> getSelectedDate() async {
    var selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));

    if (selectedDate != null) {
      return selectedDate;
    } else {
      return dateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("SQL"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: ()async{
            var userItem=CachedUser(name: "Islom", age: 22);
            await LocalDatabase.insertCachedUser(userItem);
            cachedUser=await LocalDatabase.getAllCachedUser();
            setState((){});
          }, child: Text("Running")),
          Expanded(child: ListView(children:
          List.generate(cachedUser.length, (index) {
            var currentUserItem = cachedUser[index];
            return ListTile(
              title: Text(currentUserItem.name),
              subtitle: Text(currentUserItem.age.toString()),
              trailing: Text(currentUserItem.id.toString()),
              onTap: () async{
              // await LocalDatabase.deleteCachedUserById(currentUserItem.id!);
                CachedUser newUser= CachedUser(
                    id: currentUserItem.id,
                    name: "Ali", age: 20);
              await LocalDatabase.updateCachedUser(newUser);
                await _init();
              },
            );
          }
          ),))


















          // TextButton(
          //     onPressed: () async {
          //      var toDo = CachedTodo(
          //         dateTime: "2022-07-28 21:50:32.557848",
          //         todoTitle: "Learning SQL",
          //         categoryId: 1,
          //         urgentLevel: 4,
          //         isDone: 0,
          //         todoDescription: "todoDescription",
          //       );
          //       var savedTodo =
          //       await MyRepository.insertCachedTodo(cachedTodo: toDo);
          //       _init();
          //       print(savedTodo);
          //     },
          //     child: Text("Save To Cache:")),
          // TextButton(onPressed: ()async{
          //   var us= CachedUser(
          //       name: "Islom", age: 22);
          //   var saveUs= await MyRepository.insertCachedUser(cachedUser: us);
          //   _init();
          //   print(saveUs);
          // }, child: Text("Save User")),
          // Expanded(
          //     child: ListView(
          //       children: List.generate(
          //           cachedUser.length,
          //               (index) => Text(cachedUser[index].age.toString(), style: TextStyle(color: Colors.red),
          //               )),
          //     ))
        ],
      ),
    );
  }
}