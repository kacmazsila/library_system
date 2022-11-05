import 'package:library_system/Enum/PunishmentCause.dart';
import 'package:library_system/Enum/PunishmentType.dart';
import 'package:library_system/Models/Employer.dart';
import 'package:library_system/Models/Member.dart';

class Punishment {
  Member? member;
  Employer? employer;
  DateTime? punishmentStartDate;
  DateTime? punishmentFinishDate;
  PunishmetCause? cause;
  PunishmentType? type;
}
