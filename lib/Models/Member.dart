import 'dart:ffi';

import 'package:library_system/Enum/MemberType.dart';
import 'package:library_system/Models/Employer.dart';

import 'Book.dart';
import 'Person.dart';

class Member extends Person {
  Long? memberNumber;
  List<Book>? books;
  DateTime? memberOfStartDate;
  bool isActive = false;
  bool isBlock = false;
  MemberType? type = MemberType.Starter;
  int rentTime = 0;

  List<Member>? memberList;

  @override
  bool save() {
    try {
      memberList!.add(this);

      return true;
    } catch (ex) {
      return false;
    }
  }
}
