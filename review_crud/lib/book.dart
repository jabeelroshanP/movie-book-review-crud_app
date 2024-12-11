import 'package:flutter/material.dart';
import 'package:review_crud/book_rev.dart';
import 'package:review_crud/db/function.dart';
import 'package:review_crud/model/student.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController review= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Book review",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 128, 26, 19),
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
                         hintText: "Book name"),
                         
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
              controller:review,
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
            addBook();
           },style: ElevatedButton.styleFrom(backgroundColor: Colors.white), child: Text("Save",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
         )        
        ],
      ),

    );
  }
  Future addBook()async{
    if(name.text.isNotEmpty && date.text.isNotEmpty && review.text.isNotEmpty){
      final saveBook=Model(name: name.text, date: date.text, review: review.text);
      addMoviestolist(saveBook);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Bbook(),));
    }
  }
}