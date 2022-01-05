import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name =  "Flutter learnings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Catalog App")),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to ${days}days of $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
