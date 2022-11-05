import 'package:flutter/foundation.dart';

class Book {
  String? name;
  String? writer;
  String? publisher;
  int PageCount = 0;
  Category? category;
  DateTime? publishDate;
  int publishVersion = 0;
  double price = 0;
  String seriNumber = '';

  List<Book> books = List.empty();

  bool save(Book book) {
    books.add(book);
    return true;
  }

  Book getBook(String seriNum) {
    return books.firstWhere((element) => element.seriNumber == seriNum);
  }
}
