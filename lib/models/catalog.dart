class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://static-www.o2.co.uk/sites/default/files/apple-iphone-12-mini-purple-sku-header-210421.png"),
    Item(
        id: 2,
        name: "iPhone 11 Pro",
        desc: "Apple iPhone 11th generation",
        price: 959,
        color: "#33505a",
        image:
            "https://image.dhgate.com/0x0s/f2-albu-g20-M01-9D-83-rBVaqWCh5xuAHpUgAAMJbJUpYFE872.jpg/iphone-11-pro-max-refurbished-original-apple.jpg")
  ];
}

class Item {
  final int id;
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
