import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 75,
              ),
              Positioned(
                left: 10,
                top: 20,
                child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                  iconSize: 30,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Theme.of(context).primaryColor, width: 3)
                ),
                width: 150,
                height: 150,
                child: Icon(Icons.person,
                  size: 120,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Email",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text("email@gmail.com",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("home");
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.home,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Home",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("cart");
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Cart",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("fav");
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Favorite",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.info,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("About Us",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.phone,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Contact Us",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.exit_to_app,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Sign Out",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}