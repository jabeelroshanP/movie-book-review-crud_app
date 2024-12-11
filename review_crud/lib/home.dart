import 'package:flutter/material.dart';
import 'package:review_crud/book.dart';
import 'package:review_crud/movie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Icon(Icons.search,color: Colors.black,size: 35,)
        ],
        leading: Icon(Icons.menu,size: 35,),
        backgroundColor: const Color.fromARGB(255, 116, 24, 24),
        title: Text("NETFLIX",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset("assets/Avatar.jpg",height: 350,width: 400,),
          )),
          SizedBox(height: 20,),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Movie() ,));
            },
            child: Container(
              width: 250,
              height: 40,
              child: Center(child: Text("Add Your Movie Review",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Book(),));
            },
            child: Container(
              width: 250,
              height: 40,
              child:Center(child: Text("Add Your Book Review",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}