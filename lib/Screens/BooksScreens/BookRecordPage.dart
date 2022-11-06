import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Enum/Category.dart';

class BookRecord extends StatefulWidget {
  const BookRecord({super.key});

  @override
  State<BookRecord> createState() => _BookRecordState();
}

class _BookRecordState extends State<BookRecord> {
  TextEditingController? ctrlBookName, ctrlBookWriter, ctrlBookPublisher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kitap Kayıt"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(children: [
          Container(
              child: Image.asset(
            'assets/images/book.jpeg',
            width: 200,
            height: 200,
          )),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              controller: ctrlBookName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  hintText: 'Kitap Adı'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              controller: ctrlBookWriter,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  hintText: 'Yazar Adı'),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child: DropdownButton<BookCategory>(
          //     onChanged: (BookCategory? newValue) {
          //       setState(() {});
          //     },
          //     items: BookCategory.values.map((BookCategory value) {
          //       return DropdownMenuItem<BookCategory>(child: Text(value.name));
          //     }).toList(),
          //   ),
          // )
        ]),
      ),
    );
  }
}
