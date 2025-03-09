import 'package:flutter/material.dart';
import '../data/cats.dart';
import './cat_detail_page.dart';

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
        title: const Text('Car List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.77),
          children: listOfCat.map((cat) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatDetailPage(cat: cat)));
              },
              child: Card(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        cat.pictureUrl,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(cat.name),
                    Text(cat.breed),
                    Text('${cat.age} years old'),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
