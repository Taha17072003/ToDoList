import 'package:flutter/material.dart';
import 'package:todolist/Model/todo.dart';
import 'package:todolist/Screens/login_page.dart';
import 'package:todolist/Widgets/todo_items.dart';
import 'package:todolist/colors.dart';




void main() {
  runApp(HomePage());
}


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = ToDo.todoList();
  final _todocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                children: [
                  Expanded(child: ListView(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 30, bottom: 15,
                          ),
                          child: Text(
                            'All Tasks',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      for (ToDo todoo in todoList.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChange: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todocontroller,
                          decoration: InputDecoration(
                            hintText: 'Add a new Task',
                            border: InputBorder.none,),
                        ),
                      )
                  ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todocontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60, 60)
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                )
                ]),
            ),
          ],
        ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todo){
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        todoText: todo,
      ));
    });
    _todocontroller.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                    'ToDoList',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )
                ),
              ),
              Container(
                 child:ElevatedButton(
                   style: ElevatedButton.styleFrom(
                   ),
                     onPressed: () {
                       Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(builder: (context) => LoginPage()),
                       );
                     },
                     child: Icon(
                      Icons.logout,
                      color: tdBlue,
                      size: 30,
                 )
                 )
              )

            ]
          ));
  }
}
