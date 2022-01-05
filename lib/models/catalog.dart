class CatalogModel{
    static final item = [
      Item(
          id: 1,
          name: "Laptop",
          desc: "Apple 12th gen laptop",
          price: 987,
          color: "#33505a",
          image:
          "https://i.picsum.photos/id/0/5616/3744.jpg?hmac=3GAAioiQziMGEtLbfrdbcoenXoWAW-zlyEAMkfEdBzQ")
   ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}


