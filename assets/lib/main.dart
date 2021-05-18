import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: Container(
          decoration: BoxDecoration(
        image: new DecorationImage(
        colorFilter:ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.srcOver),
            image:AssetImage('assets/grass.jpg'), //NetworkImage(
                    //"https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                    //),
            fit: BoxFit.cover
        )
    ),
         //   color: const Color(0x80aaff).withOpacity(0.1),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    height: 170,
                    width: 70,
                    child: Card(
                     
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        elevation: 10,
                         child:InkWell(child: Container(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            fit: StackFit.expand,
                            children: [
                              Image.asset('assets/musica.jpg',
                                  fit: BoxFit.fill),
                              Center(
                                child: Text("Love",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20)),
                              ),
                            ],
                          ),
                        ), onTap:(){
 AlertDialog alert= AlertDialog(title: Text("this is me"),);
   showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  ); 
                      }),
                        ));
              },
            )));
  }
}
