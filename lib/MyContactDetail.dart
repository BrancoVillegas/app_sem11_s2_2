import 'package:flutter/material.dart';

class MyContactDetail extends StatelessWidget {
  MyContactDetail(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact details!!"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            image: DecorationImage(
                image: NetworkImage(data!['picture']['large']),
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              color: Colors.deepOrange,
              width: 4,
            )
          ),
        ),
      ),
    );
  }
}



