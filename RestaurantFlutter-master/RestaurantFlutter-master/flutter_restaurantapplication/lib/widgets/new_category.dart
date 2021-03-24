import 'package:flutter/material.dart';

class NewCategory extends StatefulWidget {
  final Function addCx;

  NewCategory(this.addCx);

  @override
  _NewCategoryState createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final nameController = TextEditingController();

  final kitchenController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredKitchen = kitchenController.text;

    if (enteredKitchen.isEmpty || enteredName.isEmpty) {
      return;
    }

    widget.addCx(
      enteredName,
      enteredKitchen,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Kitchen'),
              controller: kitchenController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.text,
            ),
            FlatButton(
              child: Text('Add Category'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
