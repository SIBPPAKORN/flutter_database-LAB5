import 'package:flutter/material.dart';
import 'package:flutter_database/screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sibpakorn_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'แอปบัญชี '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return formscreen();
                  }));
                })
          ],
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, int index) {
              return Card(
                elevation: 20,
                margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(child: Text("19000")),
                  ),
                  title: Text("รายการ"),
                  subtitle: Text("31/07/65"),
                ),
              );
            }));
  }
}
