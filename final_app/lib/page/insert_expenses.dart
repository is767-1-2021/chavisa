import 'package:final_app/constants/icons.dart';
import 'package:final_app/controllers/expenses_controllers.dart';
import 'package:final_app/models/expensesClassModel.dart';
import 'package:final_app/models/modelTotal.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';

import 'calndar.dart';

class AddExpenses extends StatelessWidget {
  final ExpensesController controller;
  final DateTime selectDate;

  AddExpenses({
    Key? key,
    required this.controller,
    required this.selectDate,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String? _icon;
  String? _name;
  int? _total;

  DateFormat dFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dFormat.format(selectDate)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: _icon,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  hint: const Text('Enter your icon'),
                  onChanged: (String? newValue) {
                    _icon = newValue!;
                  },
                  items:
                      SIcons.all.entries.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.key,
                      child: Row(
                        children: [
                          Container(
                            child: value.value,
                            margin: const EdgeInsets.only(right: 5),
                          ),
                          Text(value.key.toUpperCase()),
                        ],
                      ),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select icon!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter name',
                  ),
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter total',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _total = int.parse(value!) as int?;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      try {
                        List<Expenses> listExpenses = [];
                        if (context.read<ExpensesModel>().expensesList !=
                            null) {
                          listExpenses =
                              context.read<ExpensesModel>().expensesList;
                        }
                        controller.AddExpenses(Expenses(
                          _icon,
                          _name,
                          _total,
                          selectDate,
                        ));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calendar(),
                          ),
                        );
                      } catch (e) {
                        print("error ");
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue.shade800,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
