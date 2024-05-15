import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fenjoy/model/food.dart';
import 'package:fenjoy/user/detail.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<Food> foods = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore.instance
        .collection('food')
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      setState(() {
        foods = snapshot.docs.map((doc) => Food.fromFirestore(doc)).toList();
      });
    });
  }

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
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                        category: food.category!,
                        gredients: food.gredients!,
                        image: food.image!,
                        make: food.make!,
                        name: food.name!,
                      ),
                    ));
                  },
                  child: Container(
                    width: 119.0,
                    height: 91,
                    color: index % 2 == 0 ? Colors.green : Colors.blue,
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          width: 119,
                          height: 91,
                          child: Image.network(food.image!),
                        ),
                        Spacer(),
                        Text(
                          food.name!,
                        )
                      ],
                    )),
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
