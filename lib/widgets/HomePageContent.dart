import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/screens/aftertab.dart';
import 'package:project4/widgets/horizontal_scrolleview.dart';

class HomePageContent extends StatelessWidget {
  List<QuoteModel> quotes;
  final BuildContext ctx;
  AppBar appBar;
  HomePageContent(this.quotes, this.appBar, this.ctx);

  AlertDialog alert1;
  alert(txt, context) {
    alert1 = AlertDialog(
      actions: [continueButton],

      title: Text("Qoute"),
      content: Text(txt),
      elevation: 24,
      backgroundColor: Colors.white,
    );
  }
 


  Widget continueButton = RaisedButton(
  
    padding:EdgeInsets.symmetric(horizontal:10 ,vertical:10),
    child: Center(child:Text("Ok")),
    onPressed: () {},
  );
  @override
  Widget build(BuildContext context) {
    double x;
    final portraite =
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (portraite)
    {
      x = 0.65;
    }
    else
    {
 x = 0.621;
    }
     
    return Column(children: <Widget>[
      portraite
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: horizontalScrolleView(),
            )
          : Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: horizontalScrolleView(),
            ),
      Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              x,
          child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // if you need this
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1,
                              )),
                          child: ListTile(
                            title: Text(
                              quotes[index].quote,
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(quotes[index].tag),
                            trailing: IconButton(
                                icon: Icon(Icons.favorite),
                                color: Theme.of(context).errorColor,
                                onPressed: () {}),
                            onTap: () {
                              alert(quotes[index].quote_writer, context);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert1;
                                  });
                            }
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             AfterTab(quotes[index].quote))),
                            ,
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/obama.jpg'),
                              radius: 30,
                              child: Padding(padding: EdgeInsets.all(6)),
                            ),
                          ),
                        )));
              }))
    ]);
  }
}
