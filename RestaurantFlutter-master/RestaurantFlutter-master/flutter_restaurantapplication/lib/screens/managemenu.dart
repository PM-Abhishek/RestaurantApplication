import 'package:flutter/material.dart';

class MenuManagement extends StatefulWidget {
  @override
  _MenuManagementState createState() => _MenuManagementState();
}

class Action {
  int id;
  String action;

  Action(this.id, this.action);

  static List<Action> getActions() {
    return <Action>[
      Action(1, 'Active'),
      Action(1, 'Inactive'),
      Action(1, 'Expose Online'),
      Action(1, 'Remove From Online'),
    ];
  }
}

class _MenuManagementState extends State<MenuManagement> {
  List<Action> _actions = Action.getActions();
  List<DropdownMenuItem<Action>> _dropdownMenuItems;
  Action _selectedAction;
  @override
  void initState() {
    _dropdownMenuItems = buildDropDownMenuItems(_actions);
    _selectedAction = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Action>> buildDropDownMenuItems(List actions) {
    List<DropdownMenuItem<Action>> items = List();
    for (Action action in actions) {
      items.add(
        DropdownMenuItem(
          child: Text(action.action),
          value: action,
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Action selectedAction) {
    setState(() {
      _selectedAction = selectedAction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            centerTitle: true,
            title: Text("Menu Management"),
            backgroundColor: Colors.blue,
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Action',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              width: 380.0,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: _selectedAction,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
          ],
        ));
  }
}
