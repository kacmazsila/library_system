import 'package:library_system/Enum/MemberType.dart';
import 'package:library_system/Models/Book.dart';
import 'package:library_system/Models/Employer.dart';

import 'Member.dart';

class Member_Books {
  Member? member;
  Book? book;
  DateTime? barrowDate;
  int? usingTime;
  double? usingPrice;
  Employer? employer;
  bool isRefund = false;

  List<Member_Books> lstRents = List.empty();

  void rentBook(Member member, Book book, Employer emp) {
    this.barrowDate = DateTime.now();
    this.member = member;
    this.book = book;
    this.employer = emp;
    this.usingTime = member.type == MemberType.Platinium
        ? 30
        : (member.type == MemberType.Gold ? 20 : 10);

    this.usingPrice = member.type == MemberType.Platinium ? 0 : 100;

    lstRents.add(this);
  }

  void refundBook(Book book, Member member) {
    Member_Books mBook = lstRents.firstWhere(
        (element) => (element.book == book && element.member == member));

    lstRents.remove(mBook);
    mBook.isRefund = true;
    lstRents.add(mBook);
  }
}
