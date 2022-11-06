import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          // Padding(
          //     padding: EdgeInsets.all(8),
          //     child: Image.asset('assets/images/book.jpeg')),
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
        ]),
      ),
    );
  }
}
