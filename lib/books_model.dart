import 'package:flutter/material.dart';

class Books {
  final String imageUrl, name, price;
  List<String> writer = List<String>(2);
  Books({
    @required this.name,
    @required this.imageUrl,
    @required this.writer,
    @required this.price,
  });
}

List<Books> itemList = [
  Books(
    name: "Şeker Portakalı",
    imageUrl: "seker_p.jpeg",
    writer: ["Jose Mauro De Vasconcelos", "Türkçe"],
    price: "\₺30.55",
  ),
  Books(
    name: "Simyacı",
    imageUrl: "simyaci.jpeg",
    writer: ["Paulo Coelho", "Türkçe"],
    price: "\₺21.80",
  ),
  Books(
    name: "Dune",
    imageUrl: "dune.jpeg",
    writer: ["Frank Herbert", "İngilizce"],
    price: "\₺40.00",
  ),
  Books(
    name: "Harry Potter",
    imageUrl: "harry_p.jpeg",
    writer: ["J.K. Rowling", "İngilizce"],
    price: "\₺299.99",
  ),
  Books(
    name: "ScienceUp",
    imageUrl: "dergi1.jpeg",
    writer: ["Dr.Şebnem Özdemir ", "Türkçe"],
    price: "\₺15.90",
  ),
];
