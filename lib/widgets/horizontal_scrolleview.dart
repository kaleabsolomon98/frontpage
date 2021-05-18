import 'package:flutter/material.dart';
import 'package:project4/screens/catagoryDetailpage.dart';

Widget horizontalScrolleView() {
  return Card(
    margin: EdgeInsets.only(top:5,left:5,right:5),
    elevation:5,
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                  width:160,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    elevation: 5,
                    child: InkWell(
                        child:
                          Container(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            fit: StackFit.expand,
                            children: [
                              Image.asset('assets/musica.jpg', fit: BoxFit.fill),
                              Center(
                                child: Text("Love",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20)),
                              ),
                            ],
                          ),
                    ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CatagoryDetail()));
                        }),
                  ));
            })),
  );
}
