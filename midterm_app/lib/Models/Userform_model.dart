import 'package:flutter/material.dart';

class UserFormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _cid;
  String? _phon;

  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastName => this._lastName;

  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  }

  get emailName => this._email;

  set emailName(value) {
    this._email = value;
    notifyListeners();
  }

  get cid => this._cid;

  set cid(value) {
    this._cid = value;
    notifyListeners();
  }

  get phon => this._phon;

  set phon(value) {
    this._phon = value;
    notifyListeners();
  }
}