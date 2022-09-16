mport 'package:flutter/material.dart';
import 'package:flutter_database/models/Informations.dart';
import 'package:flutter_database/models/providers/tranformation_provider.dart';
import 'package:flutter_database/models/screens/home_screen.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final productController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("การสั่งซื้อ"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField( 
                  decoration: new InputDecoration(labelText: "ชื่อสินค้า"),
                  autofocus: false,
                  controller: titleController,
                  validator: (String? str){
                      if(str!.isEmpty){
                          return "กรุณาป้อนรายการ";
                      }
                      return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "จำนวนสินค้า"),
                  keyboardType: TextInputType.number,
                  controller: productController,
                  validator: (String? str){
                    if(str!.isEmpty){
                          return "กรุณาป้อนราคาสินค้า";
                      }
                      if(double.parse(str)<=0){
                        return "กรุณาป้อนตัวเลขมากกว่า 0";
                      }
                      return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ราคาสินค้า"),
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  validator: (String? str){
                    if(str!.isEmpty){
                          return "กรุณาป้อนราคาสินค้า";
                      }
                      if(double.parse(str)<=0){
                        return "กรุณาป้อนตัวเลขมากกว่า 0";
                      }
                      return null;
                  },
                ),
                FlatButton(
                  child: Text("เพิ่มข้อมูลสินค้า"),
                  color: Colors.pink,
                  textColor: Colors.white,
                  onPressed: (){
                    if(formKey.currentState!.validate()){   
                      var title = titleController.text;
                      var product = productController.text;  
                      var price = priceController.text;  

                      Informations statement = Informations(
                        title:title,
                        product: double.parse(product),
                        price: double.parse(price),
                      );   

                      var provider = Provider.of<InformationProvider>(context,listen:false);
                      provider.addInformation(statement);
                      Navigator.push(context, MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context){
                        return HomeScreen();
                      }));
                    }
                  }, 
                  )
              ],
            ),
          ),
        ));
  }
}
