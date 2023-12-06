import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(

      title: 'Product App',
      theme : ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(child: Text('Football Options')),
      ),


      body:
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),


        ),
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _currentIndex,
        onTap: (index) {

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );

  }
}