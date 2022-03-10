// ignore_for_file: prefer_const_constructors,unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
//import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "TechnoStrap Digital";

  final url = "https://api.jsonbin.io/b/6228de547caf5d67836417d4";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // getting data from json file
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // getting data from json file
    //final response = await http.get(Uri.parse(url));

    //final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Catalog App"),
      // ),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => context.vxNav.push(Uri.parse(MyRoutes.cartRoute)),
          // ignore: deprecated_member_use
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red800,
            size: 20,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        mutations: const {AddMutations, RemoveMutations},
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
      //drawer: MyDrawer(),
    );
  }
}
