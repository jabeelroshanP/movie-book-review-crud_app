import 'package:flutter/material.dart';
import 'package:review_crud/db/function.dart';

class Msave extends StatefulWidget {
  const Msave({super.key});

  @override
  State<Msave> createState() => _MsaveState();
}

class _MsaveState extends State<Msave> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllModel();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 123, 27, 20),
        title: Text("Movie Reviews",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(valueListenable:modelNotifier , builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
          final data =value[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.movie_creation),
                  ),
                  title: Text(data.name.toString()),
                  subtitle: Text(data.date.toString()),
                  trailing: IconButton(onPressed: (){
                    deleteModel(index);
                  }, icon: Icon(Icons.delete_outline)),
                )
              ],
            ),
          );
        },);
      },)
    );
  }
}