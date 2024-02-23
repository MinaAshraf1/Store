import 'package:flutter/material.dart';
import 'package:store/details.dart';

class CustomCard extends StatefulWidget {
  final category;

   const CustomCard({super.key, required this.category,});

   @override
   State<CustomCard> createState() => _CustomCard();
}

class _CustomCard extends State<CustomCard> {
  bool fav = false;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>
              Details(category: widget.category, favaurate: fav,),
          ),
        );
      },
      child: Card(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            borderSide: BorderSide.none
        ),
        color: Theme.of(context).canvasColor,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(widget.category['img'],
                fit: BoxFit.contain,
                height: 120,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(widget.category['name'],
                maxLines: 1,

                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${widget.category['price']}\$",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      fav? fav = false : fav = true;
                    });
                  },
                  icon: fav?
                  const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border_outlined),
                  color: const Color(0xffff0000),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:  Text("Add to cart done",
                      style: TextStyle(color: Theme.of(context).primaryColor),),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Theme.of(context).canvasColor,
                      action: SnackBarAction(
                        label: "ok",
                        textColor: Theme.of(context).primaryColor,
                        onPressed: (){},
                      ),
                    )
                  );
                },
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  borderSide: BorderSide.none
                ),
                elevation: 5,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: const Text("Add To Cart",),
              ),
            )
          ],
        )
      ),
    );
  }
}