import 'package:flutter/material.dart';

class formscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("เเบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: new InputDecoration(labelText: "ชื่อรายการ"),
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "จำนวนเงิน"),
            ),
          ]),
        ));
  }
}
