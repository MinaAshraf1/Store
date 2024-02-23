import 'package:flutter/material.dart';
import 'package:store/categories.dart';
import 'package:store/customCardCart.dart';
import 'package:store/customDrawer.dart';
import 'package:store/custom_search.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _PageState();
}

class _PageState extends State<Cart> {
  ScrollController? scroll;
  Categories categories = Categories();

  @override
  void initState() {
    scroll = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scroll!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          onPressed: (){
            showSearch(context: context, delegate: CustomSearch());
          },
          icon: const Icon(Icons.search),
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          controller: scroll,
          itemCount: categories.getBestSelling().length,
          itemBuilder: (context, i) => CustomCardCart(
            category: categories.getBestSelling()[i],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scroll!.animateTo(0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
          );
        },
        mini: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
        ),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.arrow_upward, color: Colors.white, size: 20,),
      ),
    );
  }
}