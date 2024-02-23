import 'package:flutter/material.dart';
import 'package:store/customCard.dart';
import 'package:store/customDrawer.dart';

class Category extends StatefulWidget {
  final String name;
  final List category;

  const Category({super.key, required this.name, required this.category});

  @override
  State<Category> createState() => _CategoryPage();
}

class _CategoryPage extends State<Category> {
  ScrollController? scroll;

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
        title: Text(widget.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          controller: scroll,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
          ),
          itemCount: widget.category.length,
          itemBuilder: (context, i) => CustomCard(category: widget.category[i],),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scroll!.animateTo(0.0,
            duration: const Duration(milliseconds: 500),
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