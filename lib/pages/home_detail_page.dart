// ignore_for_file: prefer_const_constructors,unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}"
                .text
                .bold
                .xl4
                .color(MyTheme.darkBluishColor)
                .make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add To Cart".text.xl.make(),
            ).wh(200, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl
                        .color(Color.fromARGB(255, 150, 151, 151))
                        .make(),
                    10.heightBox,
                    "Sed ea erat dolores magna ut invidunt, et est diam vero sit stet, amet no diam et elitr eirmod accusam labore rebum. Lorem at sed et dolores stet, lorem sadipscing accusam sit ipsum lorem at aliquyam diam, sed voluptua ipsum sed et eirmod magna et stet, elitr tempor sit diam. Elitr justo ipsum et voluptua et tempor eirmod et sanctus. Stet diam dolor lorem ut accusam invidunt. Accusam lorem at voluptua at sit kasd dolores, et stet gubergren sadipscing ut lorem kasd kasd at dolor. Amet erat kasd ipsum justo amet, sit takimata stet no dolores ipsum. Lorem lorem eos."
                        .text
                        .color(Color.fromARGB(255, 150, 151, 151))
                        .make()
                        .p16(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
