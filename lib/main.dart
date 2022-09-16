import 'package:flutter/material.dart';
import 'package:flutter_database/models/Informations.dart';
import 'package:flutter_database/providers/information_provider.dart';
import 'package:flutter_database/screens/form_screen.dart';
import 'package:flutter_database/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return tranformationProvider();
        })
      ],
      child: MaterialApp(
        title: 'อุปกรณ์ของใช้',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'อุปกรณ์ของใช้'),
      ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<tranformationProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: TabBarView(children: [HomeScreen(), FormScreen()]),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: "รายการสินค้า",
            ),
            Tab(
              icon: Icon(Icons.add),
              text: "เพิ่มข้อมูล",
            )
          ],
        ),
      ),
    );
  }
}
