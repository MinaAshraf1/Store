import 'package:flutter/material.dart';
import 'package:store/categories.dart';
import 'package:store/category.dart';

class CustomSearch extends SearchDelegate {
  Categories categories = Categories();
  List? filterList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[IconButton(
      onPressed: (){
        query = "";
      },
      icon: const Icon(Icons.close),
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query == '') {
      return InkWell(
        onTap: () {
          showResults(context);
        },
        child: ListView.builder(
          itemCount: categories.getCount(),
          itemBuilder: (context, i) {
            return Container(
              color: Theme.of(context).canvasColor,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Category(
                      name: categories.getCategories()[i]['name'],
                      category: categories.getCategories()[i]['categories'],
                    ),
                  ));
                },
                child: Text(categories.getCategories()[i]['name'],
                style: Theme.of(context).textTheme.bodySmall,),
              ),
            );
          },
        ),
      );
    } else {
      filterList = categories.categoryName.where((element) => element.startsWith(query)).toList();
      return InkWell(
        onTap: () {
          showResults(context);
        },
        child: ListView.builder(
          itemCount: filterList!.length,
          itemBuilder: (context, i) => Container(
            color: Theme.of(context).canvasColor,
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Category(
                    name: categories.getCategories()[i]['name'],
                    category: categories.getCategories()[i]['categories'],
                  ),
                ));
              },
              child: Text("${filterList![i]}",
                style: Theme.of(context).textTheme.bodySmall,),
            ),
          ),
        )
      );
    }
  }

}