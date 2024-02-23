import 'package:flutter/material.dart';
import 'package:store/customDrawer.dart';

class Details extends StatefulWidget {
  final category;
  final bool favaurate;

  const Details({super.key, required this.category, required this.favaurate});

  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  bool? fav;

  @override
  void initState() {
    fav = widget.favaurate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review",
          style: TextStyle(
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
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Theme.of(context).canvasColor,
                  child: Image.asset(widget.category['img'],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          fav!? fav = false : fav = true;
                        });
                      },
                      icon: fav!?
                      const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border),
                      color: const Color(0xffff0000),
                    ),
                  ),
                )
              ],
            )
          ),

          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.category['name'],
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Description",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text("${widget.category['describe']}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Price: ${widget.category['price']}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: (){

                  },
                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      borderSide: BorderSide.none
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50
                  ),
                  elevation: 5,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: const Text("Add To Cart",),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}