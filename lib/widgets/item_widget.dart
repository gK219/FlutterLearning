import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  ItemWidget({Key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${item.name} "),
          action: SnackBarAction(
            textColor: Colors.redAccent,
            label: "price  \$${item.price}", onPressed: () { ScaffoldMessenger.of(context).hideCurrentSnackBar(); },
          ),
        ));
      },
      leading: Image.network(item.image),
      title: Text(item.name),
      subtitle: Text(
          item.desc,
          style: TextStyle(fontSize: 12),
      ),
      trailing: Text(
        "\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
