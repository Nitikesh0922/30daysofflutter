class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Item(
      id: "TEC01",
      name: "iPhone 12 Pro",
      desc: "This is testing description",
      price: 999,
      color: "#33505a",
      image:
          "https://www.techinn.com/f/13782/137821860/apple-iphone-12-pro-6gb-128gb-6.1.jpg")
];
