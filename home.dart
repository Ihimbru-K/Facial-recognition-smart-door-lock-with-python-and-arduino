import 'package:flutter/material.dart';

import '../Widgets/todo_item.dart';
import '../constants/colors.dart';
import '../model/ToDo.dart';


class Home extends StatelessWidget {
   Home(Key? key) : super(key:key);

  final todoList = ToDo.todoList();

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBgcolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: tdBlack, size: 30,),
          Container(height: 40, width: 40, child: ClipRRect(borderRadius: BorderRadius.circular(20), child : Image.asset('assets/images/kboy.jpg')),)
        ],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBgcolor,
        appBar: _buildAppBar(),
        body: Stack(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child : Column(
                children: [
                  searchBox(),
                  Expanded(child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'All ToDos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                        ),
                      ),
                      for ( ToDo todoo in todoList)

                      /**first todo below is the one we are expecting from the list
                       * second todo is from the widget expecting to do items
                       */
                        ToDoItem(todo: todoo,), //passing todo items to the todo widged


                    ],
                  )
                  )
                ],
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0,0.0), blurRadius: 10.0, spreadRadius: 0.0),],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(
                    bottom : 20,
                    right: 20,
                  ),
                  child: ElevatedButton( child: Text("+", style: TextStyle(fontSize: 40),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60,60),
                      elevation: 10,

                    ),
                    onPressed: () {},

                  ),
                )

              ]
            ),

          )
        ],),// Stack widget will contain everything on the screen

    );
  }

  Widget searchBox() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack, size : 20),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText : 'Search',
            hintStyle : TextStyle(color: tdGrey)

        ),

      ),
    );
  }
}