import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:my_flutter_app/models/catalog.dart';
import 'package:my_flutter_app/widgets/drawer.dart';
import 'package:my_flutter_app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name =  "Flutter learnings";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 10));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData =  decodeData["products"];
    //print(productData);
     CatalogModel.items = List.from(productData)
         .map<Item>((item) => Item.fromMap(item))
         .toList();

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(10, (index) => CatalogModel.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty ) ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
          return ItemWidget(
            item: CatalogModel.items[index],
          );
          },
        )
        : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
