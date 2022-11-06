import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Models/Employer.dart';

class EmployeeOperation_Widget extends StatefulWidget {
  const EmployeeOperation_Widget({super.key});

  @override
  State<EmployeeOperation_Widget> createState() =>
      _EmployeeOperation_WidgetState();
}

class _EmployeeOperation_WidgetState extends State<EmployeeOperation_Widget> {
  TextEditingController ctName = TextEditingController();
  TextEditingController ctLastName = TextEditingController();
  TextEditingController ctPhone = TextEditingController();
  TextEditingController ctEmail = TextEditingController();

  List<Employer> lstEmployees = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Çalışan Ekle"), backgroundColor: Colors.red),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: ctName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    hintText: 'Adınızı Giriniz'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctLastName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      hintText: 'Soyad Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctPhone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      hintText: 'Telefon Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      hintText: 'Email Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: saveEmployee,
                  child: Text("Kaydet"),
                ),
              ),
              !lstEmployees.isEmpty
                  ? Container(
                      height: 50,
                      child: ListView.builder(
                          itemCount: lstEmployees.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  lstEmployees[index].firstName.toString()),
                            );
                          }),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  saveEmployee() {
    Employer emp = new Employer();

    emp.firstName = ctName.text.toString();
    emp.lastName = ctLastName.text.toString();
    emp.phoneNumber = ctPhone.text.toString();
    emp.eMail = ctEmail.text.toString();

    setState(() {
      emp.save();
      lstEmployees = emp.getEmployees();
    });
  }
}
