import 'dart:async';
import 'package:final_app/models/expensesClassModel.dart';
import 'package:final_app/services/expenses_service.dart';

class ExpensesController {
  final ExpensesService services;
  List<Expenses> expenses = List.empty();

  StreamController<Map<String, dynamic>> onSyncController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get onSync => onSyncController.stream;

  ExpensesController(this.services);

  Future<List<Expenses>> fecthExpenses(DateTime selectDate) async {
    // onSyncController.add(true);
    expenses = await services.getExpensesModel(selectDate);
    services.getTotal().then((value) {
      onSyncController.add({
        'loading': false,
        'total': value,
      });
    });
    // onSyncController.add(false);
    // dispose();
    return expenses;
  }

  void AddExpenses(Expenses items) async {
    services.addExpensesModel(items);
  }

  void dispose() {
    onSyncController.close();
  }
}
