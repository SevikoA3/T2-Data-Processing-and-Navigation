import 'package:flutter/material.dart';
import '../data/cats.dart';

class CatListPage extends StatefulWidget {
  const CatListPage({super.key});

  @override
  State<CatListPage> createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  final listOfCat = catList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: listOfCat.map((cat) {
            return Card(
              child: Column(
                children: [
                  Image.network(cat.pictureUrl),
                  Text(cat.name),
                  Text(cat.breed),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
