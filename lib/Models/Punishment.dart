import 'package:library_system/Enum/PunishmentCause.dart';
import 'package:library_system/Enum/PunishmentType.dart';
import 'package:library_system/Models/Book.dart';
import 'package:library_system/Models/Employer.dart';
import 'package:library_system/Models/Member.dart';
import 'package:library_system/Models/Member_Books.dart';

class Punishment {
  Member? member;
  Employer? employer;
  DateTime? punishmentStartDate;
  DateTime? punishmentFinishDate;
  PunishmentCause? cause;
  PunishmentType? type;
  double? amountOfPunishment;
  int? dayOfPunishment;
  Member_Books? memberBooks;
  Book? book;

  bool ApplyPunishment(
      Member_Books membook, PunishmentCause cause, Employer empPunish) {
    memberBooks = membook;
    member = membook.member;
    book = membook.book;
    employer = empPunish;
    punishmentStartDate = DateTime.now();

    type = cause == PunishmentCause.bookDeformation
        ? PunishmentType.publicService
        : (cause == PunishmentCause.lateDelivery
            ? PunishmentType.block
            : PunishmentType.money);

    punishmentFinishDate = (type == PunishmentType.publicService
        ? (punishmentStartDate!.add(Duration(days: 15)))
        : (punishmentStartDate!.add(Duration(days: 10))));

    amountOfPunishment =
        type == PunishmentType.money && cause == PunishmentCause.bookDeformation
            ? 100
            : 10;

    return true;
  }
}
