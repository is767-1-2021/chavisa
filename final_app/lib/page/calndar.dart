import 'package:final_app/constants/icons.dart';
import 'package:final_app/controllers/expenses_controllers.dart';
import 'package:final_app/models/expensesClassModel.dart';
import 'package:final_app/models/modelTotal.dart';
import 'package:final_app/services/expenses_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'insert_expenses.dart';

class Calendar extends StatefulWidget {
  var service = ExpensesService();
  var controller;

  Calendar() {
    controller = ExpensesController(service);
  }

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<Expenses> _expendedList = List.empty();
  bool isLoading = false;

  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  int total = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.onSync.listen((value) {
      // setState(() => isLoading = syncState);
      setState(() {
        total = value['total'];
      });
    });
    isLoading = false;
    DateTime now = DateTime.now();
    _getExpenses(DateTime(now.year, now.month, now.day));
  }

  void _getExpenses(date) async {
    List<Expenses> newExpensesList =
        await widget.controller.fecthExpenses(date);
    int tmpTotal = 0;
    setState(() {
      _expendedList = newExpensesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Expenses> _expenses = [];
    if (context.read<ExpensesModel>().expensesList != null) {
      _expendedList = context.read<ExpensesModel>().expensesList;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExpenses(
                controller: widget.controller,
                selectDate: focusedDay,
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("${total.toString()} ฿"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              // Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                _getExpenses(focusDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              //To style the Calendar
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: _expendedList.length,
              itemBuilder: (context, int index) {
                var value = _expendedList[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: FittedBox(
                        child: SIcons.all[value.icon],
                      ),
                    ),
                    title: Text('${value.name}'),
                    trailing: Text('${value.total.toString()} ฿'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
