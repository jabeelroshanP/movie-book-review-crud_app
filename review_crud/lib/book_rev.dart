import 'package:flutter/material.dart';
import 'package:review_crud/db/function.dart';
import 'package:review_crud/home.dart';

class Bbook extends StatefulWidget {
  const Bbook({super.key});

  @override
  State<Bbook> createState() => _BbookState();
}

class _BbookState extends State<Bbook> {

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllModel();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 28, 21),
        title: Text("Book Review",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(valueListenable: modelNotifier, builder:(context, value, child) {
        
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
          final booksr =value[index];
          return Card(
            child: Column(
              children: [
                
                ListTile(
                  leading: Icon(Icons.book_sharp),
                  title: Text(booksr.name.toString()),
                  subtitle: Text(booksr.date.toString()),
                  trailing: IconButton(onPressed: (){
                    deleteModel(index);
                  }, icon: Icon(Icons.delete_outline)),
                ),
              
              ],
              
            ),
            
          );
          
          
        },);
      },),
      
    );
  }
}