import 'package:flutter/material.dart';
import 'package:tugas2/model/Cat.dart';

class CatDetailPage extends StatefulWidget {
  final Cat cat;
  
  const CatDetailPage({super.key, required this.cat});

  @override
  State<CatDetailPage> createState() => _CatDetailPageState();
}

class _CatDetailPageState extends State<CatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cat.name} Car"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.cat.pictureUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.cat.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Type: ${widget.cat.breed}",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Text(
                'Build Date: ${widget.cat.birthday.day}/${widget.cat.birthday.month}/${widget.cat.birthday.year}',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Background:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                widget.cat.background,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Color: ${widget.cat.color}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Gender: ${widget.cat.sex == 'M' ? "Male" : "Female"}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Vaccines:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              widget.cat.vaccines.isEmpty
                  ? Text('No vaccines recorded', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.cat.vaccines.map((vaccine) =>
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text('- $vaccine', style: TextStyle(fontSize: 16)),
                        )
                      ).toList(),
                    ),
              SizedBox(height: 16),
              Text(
                'Car Characteristics:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              widget.cat.characteristics.isEmpty
                  ? Text('No characteristics recorded', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.cat.characteristics.map((characteristic) =>
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text('- $characteristic', style: TextStyle(fontSize: 16)),
                        )
                      ).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}