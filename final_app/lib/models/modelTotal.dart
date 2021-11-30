// ignore: file_names
import 'dart:collection';
import 'package:final_app/models/expensesClassModel.dart';
import 'package:flutter/material.dart';

class ExpensesModel extends ChangeNotifier {
  String? icon;
  String? name;
  int? total;
  List<Expenses>? _expensesList;

  get getIcon => this.icon;

  set setIcon(icon) {
    this.icon = icon;
    notifyListeners();
  }

  get getName => this.name;

  set setName(name) {
    this.icon = icon;
    notifyListeners();
  }

  get getTotal => this.total;

  set setTotal(total) {
    this.icon = icon;
    notifyListeners();
  }

  get expensesList => this._expensesList;

  set setExpensesList(value) {
    this._expensesList = value;
    notifyListeners();
  }

  final List<Expenses> _item = [];

  UnmodifiableListView<Expenses> get items => UnmodifiableListView(_item);

  List<Expenses> getExpensesList() {
    return _item;
  }

  void AddExpensesList(Expenses item) {
    _item.add(item);
    notifyListeners();
  }

  void RemoveExpensesList(Expenses item) {
    _item.remove(item);
    notifyListeners();
  }
}
