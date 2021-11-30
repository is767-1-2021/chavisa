import 'package:cloud_firestore/cloud_firestore.dart';

class Expenses {
  String? icon;
  String? name;
  int? total;
  DateTime? date;

  Expenses(this.icon, this.name, this.total, this.date);

  factory Expenses.fromDs(
    Map<String, Object?> json,
  ) {
    var cDate = (json['date'] as Timestamp).toDate();
    return Expenses(
      json['icon'] as String,
      json['name'] as String,
      json['total'] as int,
      cDate,
    );
  }
}

class AllExpenses {
  final List<Expenses> expenses;
  AllExpenses(this.expenses);

  factory AllExpenses.fromSnapshot(QuerySnapshot s) {
    List<Expenses> users = s.docs.map((DocumentSnapshot ds) {
      return Expenses.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllExpenses(users);
  }
}
