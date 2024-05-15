import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fenjoy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Food> foods = [
    Food('Pizza', 'asset/images/pizza.jpg'),
    Food('Burger', 'asset/images/burger.jpg'),
    Food('Sushi', 'asset/images/sushi.jpg'),
    Food('Pizza', 'asset/images/pizza.jpg'),
    Food('Burger', 'asset/images/burger.jpg'),
    Food('Sushi', 'asset/images/sushi.jpg'),
    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fenjoy'),
        backgroundColor: const Color(0xFFFFD101),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add your shopping cart functionality here
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: (String value) {
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'Asia',
                child: Container(
                  width: double.infinity,
                  child: Text('Asia'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Europe',
                child: Container(
                  width: double.infinity,
                  child: Text('Europe'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Africa',
                child: Container(
                  width: double.infinity,
                  child: Text('Africa'),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Most Searched',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            items: foods.map((food) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            food.imagePath,
                            fit: BoxFit.cover,
                            width: 86,
                            height: 109,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          food.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 1.0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 0.25, // Show 4 items at a time
            ),
          ),
        ],
      ),
    );
  }
}

class Food {
  final String name;
  final String imagePath;
  Food(this.name, this.imagePath);
}
