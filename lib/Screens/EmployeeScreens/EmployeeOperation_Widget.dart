import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Models/Employer.dart';
import 'package:library_system/Screens/EmployeeScreens/EmployeeDetailWidget.dart';

import '../../Enum/EmployeeType.dart';

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

  List<Employer> lstEmployees = <Employer>[];

  EmployeeType? selectedEmpType;

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
                padding: const EdgeInsets.all(5),
                child: DropdownButton<EmployeeType>(
                  onChanged: (EmployeeType? newValue) {
                    setState(() {
                      selectedEmpType = newValue;
                    });
                  },
                  items: EmployeeType.values.map((EmployeeType value) {
                    return DropdownMenuItem<EmployeeType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              // !lstEmployees.isEmpty
              //     ? Padding(
              //         padding: const EdgeInsets.all(5),
              //         child: DropdownButton<Employer>(
              //           onChanged: (Employer? newValue) {
              //             setState(() {});
              //           },
              //           items: lstEmployees.map((Employer value) {
              //             return DropdownMenuItem<Employer>(
              //               value: value,
              //               child: Text(value.firstName.toString()),
              //             );
              //           }).toList(),
              //         ),
              //       )
              //     : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: saveEmployee,
                  child: Text("Kaydet"),
                ),
              ),
              !lstEmployees.isEmpty
                  ? Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: lstEmployees.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                  title: Text(
                                      lstEmployees[index].firstName.toString()),
                                  subtitle: Text(
                                      lstEmployees[index].lastName.toString()),
                                  leading: Icon(Icons.person),
                                  trailing: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeDetailWidget(
                                                  employee:
                                                      lstEmployees[index]),
                                        ));
                                  },
                                ),
                              ),
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
      //emp.save();
      // lstEmployees = emp.getEmployees();
      lstEmployees.add(emp);
      ctName.text = "";
      ctLastName.text = "";
      ctEmail.text = "";
      ctPhone.text = "";
    });
  }
}
