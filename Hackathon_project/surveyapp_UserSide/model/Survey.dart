import 'package:flutter/material.dart';
class ListModel extends StatefulWidget {
  const ListModel({Key? key}) : super(key: key);

  @override
  State<ListModel> createState() => _ListModelState();
}

class _ListModelState extends State<ListModel> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context, "justtemp");
      },
      child: Container(
    
          margin: EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromARGB(
                  255, 240, 240, 240),
              borderRadius: BorderRadius.circular(5)
          ),
    
          padding: EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
    
            children: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Demand Survey",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),),
                      Text('~ Asian Paints',style: TextStyle(color: Colors.grey),)
               ],
             ),
                   SizedBox(height: 15),     
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                     Icon(Icons.currency_rupee),
                     Text('0.21',style: TextStyle(fontSize: 16),)
                    ],),
                    Row(
                      children: [
                        Text("MCQ")
                      ],
                    )
                  ],
    
                ),
              ),
    
    
            ],
        
      )),
    );
  }
}
