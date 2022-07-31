import 'package:flutter/material.dart';

class formscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("เเบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormField(
              decoration: new InputDecoration(labelText: "ชื่อรายการ"),
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "จำนวนเงิน"),
            ),
            FlatButton(
              child: Text("เพิ่มข้อมูล"),
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {},
            )
          ]),
        ));
  }
}
