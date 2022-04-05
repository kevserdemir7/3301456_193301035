import 'package:flutter/material.dart';

class Library {
  final String imageUrl, name, address;
  Library({
    @required this.name,
    @required this.imageUrl,
    @required this.address,
  });
}

List<Library> bookList = [
  Library(
    name: "Beyazıt Devlet K.",
    imageUrl: "ktp_1.jpg",
    address: "Fatih/İstanbul, Türkiye",
  ),
  Library(
    name: "Topkapı Kütüphanesi",
    imageUrl: "ktp_2.webp",
    address: "Fatih/İstanbul, Türkiye",
  ),
  Library(
    name: "Atatürk Kitaplığı",
    imageUrl: "ktp_3.jpg",
    address: "Beyoğlu/İstanbul, Türkiye",
  ),
  Library(
    name: "Salt Beyoğlu K.",
    imageUrl: "ktp_4.jpg",
    address: "Beyoğlu/İstanbul, Türkiye",
  ),
  Library(
    name: "Şemsipaşa K.",
    imageUrl: "ktp_5.webp",
    address: "Üsküdar/İstanbul, Türkiye",
  ),
];
