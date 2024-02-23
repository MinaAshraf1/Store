import 'package:flutter/material.dart';

class Categories {
  List category = [
    {
      'name': 'Laptop',
      'icon': Icons.laptop,
      'categories': [
        {
          'name': 'hp zbook g2',
          'img': 'images/1.png',
          'describe': 'I7 4th \nNvidia 2GB \n8 ram\n 500HDD',
          'price': 8500,
        },
        {
          'name': 'Lenovo V15',
          'img': 'images/2.png',
          'describe': 'I7 4th \nNvidia 4GB \n16 ram\n 500HDD',
          'price': 25000,
        },
        {
          'name': 'hp h630',
          'img': 'images/3.png',
          'describe': 'I5 4th \nNvidia 2GB \n4 ram\n 500HDD',
          'price': 6200,
        },
        {
          'name': 'Dell g3',
          'img': 'images/4.png',
          'describe': 'I5 10th \nAMD 2GB \n8 ram\n 500HDD',
          'price': 12500,
        },
        {
          'name': 'hp zbook g2',
          'img': 'images/1.png',
          'describe': 'I7 4th \nNvidia 2GB \n8 ram\n 500HDD',
          'price': 8500,
        },
        {
          'name': 'Lenovo V15',
          'img': 'images/2.png',
          'describe': 'I7 4th \nNvidia 4GB \n16 ram\n 500HDD',
          'price': 25000,
        },
        {
          'name': 'hp h630',
          'img': 'images/3.png',
          'describe': 'I5 4th \nNvidia 2GB \n4 ram\n 500HDD',
          'price': 6200,
        },
        {
          'name': 'Dell g3',
          'img': 'images/4.png',
          'describe': 'I5 10th \nAMD 2GB \n8 ram\n500HDD',
          'price': 12500,
        },
      ]
    },
    {
      'name': 'Mobile',
      'icon': Icons.phone_android,
      'categories': [
        {
          'name': 'Iphone 12 pro',
          'img': 'images/11.png',
          'describe': '256GB \n8 ram',
          'price': 20000,
        },
        {
          'name': 'Samsung a13',
          'img': 'images/112.png',
          'describe': '128GB \n8 ram',
          'price': 7000,
        },
        {
          'name': 'Redmi 10',
          'img': 'images/113.png',
          'describe': '64GB \n4 ram',
          'price': 5000,
        },
        {
          'name': 'Vivo Y02s',
          'img': 'images/114.png',
          'describe': '64GB \n4 ram',
          'price': 4000,
        },
        {
          'name': 'Realme c33',
          'img': 'images/115.png',
          'describe': '128GB \n8 ram',
          'price': 7000,
        },
      ]
    },
    {
      'name': 'Watch',
      'icon': Icons.watch,
      'categories': [
        {
          'name': 'Watch 1',
          'img': 'images/111.png',
          'describe': 'smart \nTime',
          'price': 1000,
        },
        {
          'name': 'Watch 2',
          'img': 'images/1112.png',
          'describe': 'smart \nTime',
          'price': 820,
        },
      ]
    },
    {
      'name': 'Camera',
      'icon': Icons.camera_alt,
      'categories': [
        {
          'name': 'Canon 1',
          'img': 'images/11111.png',
          'describe': 'Digital \nfast ',
          'price': 25000,
        },
      ]
    },
    {
      'name': 'Bag',
      'icon': Icons.shopping_bag_sharp,
      'categories': [
        {
          'name': 'Bag 1',
          'img': 'images/store.png',
          'describe': 'describe ',
          'price': 1000,
        },
      ]
    },
    {
      'name': 'Bike',
      'icon': Icons.bike_scooter,
      'categories': [
        {
          'name': 'Bike 1',
          'img': 'images/store.png',
          'describe': 'describe ',
          'price': 1000,
        },
      ]
    },
    {
      'name': 'Car',
      'icon': Icons.car_repair_rounded,
      'categories': [
        {
          'name': 'Car 1',
          'img': 'images/store.png',
          'describe': 'describe ',
          'price': 1000,
        },
      ]
    },
    {
      'name': 'Gift',
      'icon': Icons.card_giftcard,
      'categories': [
        {
          'name': 'Gift 1',
          'img': 'images/store.png',
          'describe': 'describe ',
          'price': 1000,
        },
      ]
    },
  ];
  List categoryName = [];
  List bestSelling = [];
  // List fav = [];
  // int favCount = 0;

  Categories() {
    setCategoriesName();
  }

  int getCount() {
    return category.length;
  }

  List getCategories() {
    return category;
  }

  void setCategoriesName() {
    for(int i = 0; i < getCount(); i++) {
      categoryName.add(category[i]['name'].toString());
    }
  }

  List getBestSelling() {
    bestSelling.addAll(category[0]['categories']);
    return bestSelling;
  }
}