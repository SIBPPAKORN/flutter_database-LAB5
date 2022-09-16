import 'package:flutter/material.dart';

class transaction {
  String title; //ชื่อรายการ
  double product; //ชื่อสินค้า
  double price; //ราคาสินค้า

  transaction(
      {required this.title, required this.product, required this.price});
}
