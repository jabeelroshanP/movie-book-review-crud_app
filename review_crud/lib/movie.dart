import 'package:flutter/material.dart';
import 'package:review_crud/db/function.dart';
import 'package:review_crud/model/student.dart';
import 'package:review_crud/movie_rev.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  TextEditingController name= TextEditingController();
  TextEditingController date= TextEditingController();
  TextEditingController review= TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 25, 25),
        title: Text("Movie Review",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: Column(
        children: [
         SizedBox(
          width: 370,
           child: Padding(
             padding: const EdgeInsets.only(top: 50.0,left: 30),
             child: TextFormField(
              controller: name,
              
                         decoration: InputDecoration(border: OutlineInputBorder(),
                         fillColor: Colors.white,
                         filled: true,
                         hintText: "Movie name"),
                         
                       ),
           ),
         ),
          SizedBox(
          width: 370,
           child: Padding(
             padding: const EdgeInsets.only(top: 20.0,left: 30),
             child: TextFormField(
              controller: date,
              
                         decoration: InputDecoration(border: OutlineInputBorder(),
                         fillColor: Colors.white,
                         filled: true,
                         hintText: "Release Date"),
                         
                       ),
           ),
         ),
          SizedBox(
            height: 180,
          width: 370,
           child: Padding(
             padding: const EdgeInsets.only(top: 20.0,left: 30),
             child: TextFormField(
              controller: review,
              maxLength: 200,
              maxLines: 6,
                         decoration: InputDecoration(border: OutlineInputBorder(),
                         fillColor: Colors.white,
                         filled: true,
                         hintText: "Review"
                         ),
                       ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 40.0),
           child: ElevatedButton(onPressed: (){
            addMovie();
           },style: ElevatedButton.styleFrom(backgroundColor: Colors.white), child: Text("Save",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
         )        
        ],
      ),
    );
  }
  Future<void>addMovie()async{
    if(name.text.isNotEmpty && date.text.isNotEmpty && review.text.isNotEmpty){
   final save=   Model(name: name.text, date: date.text, review: review.text);
   addMoviestolist(save);
   Navigator.push(context, MaterialPageRoute(builder: (context) => Msave(),));
    }
  }
}