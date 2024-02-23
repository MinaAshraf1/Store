import 'package:flutter/material.dart';
import 'package:store/categories.dart';
import 'package:store/category.dart';
import 'package:store/customCard.dart';
import 'package:store/customDrawer.dart';
import 'package:store/custom_search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  ScrollController? scroll;
  Categories categories = Categories();
  int? bestCount;


  @override
  void initState() {
    bestCount = categories.getBestSelling().length;
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
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      endDrawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          controller: scroll,
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: (){
                      showSearch(context: context, delegate: CustomSearch());
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: const EdgeInsets.all(10),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Theme.of(context).canvasColor,
                      filled: true
                    ),
                    cursorColor: Colors.blue,
                    showCursor: false,
                  ),
                ),

                IconButton(
                  onPressed: (){
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                  padding: const EdgeInsets.all(10),
                  icon: const Icon(Icons.menu),
                  iconSize: 40,
                ),
              ],
            ),

            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                MaterialButton(
                  onPressed: (){
                    scaffoldKey.currentState!.showBottomSheet(
                      (context) => SizedBox(
                        height: 550,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 5,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [BoxShadow(
                                    color: Theme.of(context).primaryColor,
                                    offset: const Offset(0, 0),
                                    blurRadius: 1,
                                    blurStyle: BlurStyle.solid,
                                    spreadRadius: 1
                                ),],
                              ),
                            ),
                            Expanded(child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 175,
                              ),
                              itemCount: categories.getCount(),
                              itemBuilder: (context, i) => InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Category(
                                      name: categories.categoryName[i],
                                      category: categories.getCategories()[i]['categories'],
                                    ),
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(categories.getCategories()[i]['icon'],
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(categories.categoryName[i],
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),)
                          ],
                        ),
                      )
                    );
                  },
                  child: const Text("See All",
                    style: TextStyle(
                       decoration: TextDecoration.underline,

                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 150,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Category(
                          name: categories.categoryName[i],
                          category: categories.getCategories()[i]['categories'],
                        ),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(categories.getCategories()[i]['icon'],
                              size: 50,
                              color: Colors.grey[200],
                            ),
                          ),
                          Text(categories.categoryName[i],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),

            Text("Best Selling",
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bestCount,
              itemBuilder: (context, i) =>
                  CustomCard(category: categories.getBestSelling()[i])
            )
          ],
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