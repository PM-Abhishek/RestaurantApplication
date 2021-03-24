import 'package:flutter/material.dart';
import 'package:flutter_restaurantapplication/widgets/category_list.dart';
import '../widgets/new_category.dart';
import '../widgets/category_list.dart';
import '../models/Category.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<Category> _userCategory = [
    Category(id: 'c1', name: 'Veg Starters', kitchen: 'Garden'),
    Category(id: 'c2', name: 'Veg Main Course', kitchen: 'Main Kitchen'),
  ];

  void _addNewCategory(String cxname, String cxkitchen) {
    final newCx = Category(id: '4', name: cxname, kitchen: cxkitchen);
    setState(() {
      _userCategory.add(newCx);
    });
  }

  void _startAddNewCategory(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewCategory(_addNewCategory),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Menu Creation"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CategoryList(_userCategory),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _startAddNewCategory(context);
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Create Category',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 0, 2.5, 0),
                      child: Container(
                        height: 32.0,
                        width: 3.0,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.add, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
