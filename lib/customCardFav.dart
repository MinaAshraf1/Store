import 'package:flutter/material.dart';
import 'package:store/details.dart';

class CustomCardFav extends StatefulWidget {
  final category;

   const CustomCardFav({super.key, required this.category});

   @override
   State<CustomCardFav> createState() => _CustomCard();
}

class _CustomCard extends State<CustomCardFav> {
  bool fav = true;
  
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
        color: Theme.of(context).canvasColor,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListTile(

          title: Text('${widget.category['name']}'),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall,
          subtitle: Text('${widget.category['price']}\$',),
          subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
          leading: SizedBox(
            width: 50,
            child: Image.asset(widget.category['img'],
              fit: BoxFit.fill,
            ),
          ),
          trailing: IconButton(
            onPressed: (){
              setState(() {
                fav? fav = false : fav = true;
              });
            },
            icon: fav? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
            color: const Color(0xffff0000),
          ),
        ),
      ),
    );
  }
}