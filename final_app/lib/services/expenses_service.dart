import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/expensesClassModel.dart';

abstract class SExpensesService {
  Future<List<Expenses>> getExpensesModel(DateTime selectDate);
  Future<void> addExpensesModel(Expenses expensesModel);
}

class ExpensesService extends SExpensesService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('expenses');

  @override
  Future<List<Expenses>> getExpensesModel(DateTime selectDate) async {
    var next = selectDate.add(const Duration(days: 1));

    QuerySnapshot snapshot = await _ref
        .where(
          "date",
          isGreaterThan: DateTime(
            selectDate.year,
            selectDate.month,
            selectDate.day,
          ),
        )
        .where(
          'date',
          isLessThan: DateTime(
            next.year,
            next.month,
            next.day,
          ),
        )
        .get();

    AllExpenses expenses = AllExpenses.fromSnapshot(snapshot);
    return expenses.expenses;
  }

  @override
  Future<void> addExpensesModel(Expenses items) {
    updateTotal(items.total as int);
    return _ref.add({
      'icon': items.icon,
      'name': items.name,
      'total': items.total,
      'date': items.date,
    });
  }

  Future<int> getTotal() async {
    DocumentSnapshot<Object?> snapshot = await _ref.doc('total').get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data['total'] as int;
    } else {
      return 0;
    }
  }

  void updateTotal(int value) async {
    var total = await _ref.doc('total').get();

    if (!total.exists) {
      _ref.doc('total').set({'total': value});
    } else {
      _ref.doc('total').update({'total': FieldValue.increment(value)});
    }
  }
}
