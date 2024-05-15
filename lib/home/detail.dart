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
    return const Placeholder();
  }
}
