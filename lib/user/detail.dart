import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String category;
  final String name;
  final String gredients;
  final String image;
  final String make;

  const DetailPage(
      {required this.category,
      required this.name,
      required this.gredients,
      required this.image,
      required this.make,
      super.key});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fenjoy'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 254,
            child: Row(
              children: [
                Center(
                  child: SizedBox(
                    width: 222,
                    height: 222,
                    child: Image.network(widget.image),
                  ),
                ),
                Text(widget.name),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 458,
            child: Column(
              children: [
                Text(widget.gredients),
                Text(widget.make),
              ],
            ),
          )
        ],
      ),
    );
  }
}
