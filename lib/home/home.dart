import 'package:flutter/material.dart';
import 'package:fenjoy/home/detail.dart';
import 'package:fenjoy/model/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Food food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fenjoy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Soup'),
          SizedBox(
            height: 124,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                        category: food.category!,
                        gredients: food.gredients!,
                        image: food.image!,
                        make: food.make!,
                        name: food.name!,
                      ),
                    ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 119.0,
                        height: 91,
                        color: index % 2 == 0 ? Colors.green : Colors.blue,
                        child: Center(child: Text('Item ${index + 1}')),
                      ),
                      Text('')
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
