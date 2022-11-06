import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Models/Employer.dart';

class EmployeeDetailWidget extends StatelessWidget {
  EmployeeDetailWidget({super.key, required this.employee});

  Employer employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Çalışan"), backgroundColor: Colors.red),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(employee.firstName.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(employee.lastName.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(employee.eMail.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(employee.phoneNumber.toString()),
                ),
              ],
            ),
          ),
        ));
  }
}
