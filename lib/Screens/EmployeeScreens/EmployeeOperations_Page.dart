import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Enum/EmployeeType.dart';
import '../../Models/Employer.dart';

class EmployeeOperations_Page extends StatelessWidget {
  TextEditingController cntrllerName = TextEditingController();
  TextEditingController cntrllerLastName = TextEditingController();
  TextEditingController cntrllerPhone = TextEditingController();

  saveEmployee() {
    Employer emp = Employer();

    emp.firstName = cntrllerName.text.toString();
    emp.lastName = cntrllerLastName.text.toString();
    emp.phoneNumber = cntrllerPhone.text.toLowerCase();
    emp.jType = JobType.fulltime;

    emp.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Çalışan Ekle")),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Text("Adı:"),
              TextField(
                controller: cntrllerName,
                style: TextStyle(fontSize: 12, color: Colors.red),
              )
            ],
          ),
          Row(
            children: [
              Text("Soyadı:"),
              TextField(
                controller: cntrllerLastName,
                style: TextStyle(fontSize: 12, color: Colors.red),
              )
            ],
          ),
          Row(
            children: [
              Text("Telefon:"),
              TextField(
                controller: cntrllerPhone,
                style: TextStyle(fontSize: 12, color: Colors.red),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(onPressed: saveEmployee, child: Text("Kaydet"))
        ],
      )),
    );
  }
}
