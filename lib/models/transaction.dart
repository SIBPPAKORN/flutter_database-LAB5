import 'package:flutter/material.dart';

class transaction {
  String title; //ชื่อรายการ
  double product;
  double price;

  transaction(
      {required this.title, required this.product, required this.price});
}
