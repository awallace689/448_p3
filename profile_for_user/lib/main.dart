import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SingleChildScrollView(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.blueGrey[700]), //TODO: implement random color picker for the user profile
              clipper: getClipper(),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width-10,
                top: MediaQuery.of(context).size.height / 20,
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Container( //profile img and box containing it
                        width: 150.0,
                        height: 150.0,
                        //left: 500,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ])),
                    SizedBox(width:15),
                    Column(
                      children: [
                        Text( //profile name
                          'Tom Cruise',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(height:5),
                        Text( //affiliation/subtext
                            'Austin Powers Talent Agency',
                            style: TextStyle(
                              fontSize: 14,
                              //fontStyle: FontStyle.italic,
                              color: Colors.grey[900],

                            ),
                        ),
                      ], //column children
                    ),
                  ], //row children
                )),  //this is the header for name, profile, etc
            Positioned( //bottom half with user info
              width: MediaQuery.of(context).size.width-10,
              top:MediaQuery.of(context).size.height/3.1,
              left:15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://yakimaymca.org/wp-content/uploads/2017/08/Telephone-icon-orange-300x300.png'),
                            ),
                          )
                      ),
                      SizedBox(width:12),
                      Text(
                          'Telephone: ',
                          style: TextStyle(
                            fontSize: 14,
                          )
                      ),
                      Text(
                          '(913) 253-2392', //makes this a link so user can click and call someone
                          style: TextStyle(
                            fontSize: 14,

                          )
                      ),

                      //SizedBox(height: 25),
                    ], //children for row
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [ //TODO: Why is there a difference between children <widget> ? seems pretty useless to use the widget one cause it just gives me errors
                      Text(
                          'Notes: ',
                          style: TextStyle(
                            fontSize: 14,
                          )
                      ),
                      myBox(),
                      //SizedBox(height:300),
                    ],
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Text(
                          'Past appointments ',
                          style: TextStyle(
                            fontSize: 14,
                          )
                      ),
                    ],
                  ),
                  SizedBox(height:5),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width*0.8,
                    child: new Column (
                      children: <Widget>[
                        new Text ("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a", textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(
                          fontSize: 14,
                        )
                      ),
                    ] //children
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://media.gq.com/photos/55958e822ca275951298731d/master/w_400,c_limit/tom-cruise-hair-08.jpg'),
                                ),
                              )
                          ),
                        ]
                      ),
                      SizedBox(width:20),
                      Column(
                        children: [
                          Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://qph.fs.quoracdn.net/main-qimg-6cdc39dfd08aa9fbfa58909a91f22b8e'),
                                ),
                              )
                          ),
                        ]
                      ),
                    ]
                  )
                ], //children for post
              ),
            )
          ],
        ));
  }
}




class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    //sets the top background color behind profile img/name
    path.lineTo(0.0, size.height / 3.5);
    path.lineTo(size.width, size.height/3.5);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

Widget myBox() {
  return Container(
    width:300,
    //margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(5.0),
    decoration: myBoxDecoration(), //             <--- BoxDecoration here
    child: Text(
      "These are where the notes go.",
      style: TextStyle(fontSize: 14.0),
    ),
  );
}

BoxDecoration myBoxDecoration() { //line underneath the notes
  return BoxDecoration(
    border: Border(
      bottom: BorderSide( //                   <--- left side
        color: Colors.black,
        width: 1.0,
      ),
    ),
  );
}

