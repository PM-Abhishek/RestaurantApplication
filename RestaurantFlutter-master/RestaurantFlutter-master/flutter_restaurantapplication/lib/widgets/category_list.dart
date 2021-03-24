import 'package:flutter/material.dart';
import '../models/Category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  CategoryList(this.categories);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            children: categories.map((cx) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    child: Text(
                      cx.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff5A5A5A)),
                    )),
                Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff939393),
                    )),
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
