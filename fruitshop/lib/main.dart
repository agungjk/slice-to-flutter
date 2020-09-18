import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _iconColor = Color(0xff585966);
  var menus = [
    {
      "bg": Color(0xffffd875),
      "name": "Fruits",
    },
    {
      "bg": Color(0xfffff),
      "name": "Vegetables",
    },
    {
      "bg": Color(0xfffff),
      "name": "Fruits Juices",
    },
    {
      "bg": Color(0xfffff),
      "name": "Special Fruits",
    },
  ];

  var fruits = [
    {
      "bg": Color(0xffdfebf8),
      "name": "Apple",
      "image": "assets/images/apple.png",
      "weight": "\$1.50/Kg",
    },
    {
      "bg": Color(0xffe3f1c4),
      "name": "Banana",
      "image": "assets/images/banana.png",
      "weight": "\$1.50/Kg",
    },
    {
      "bg": Color(0xffffe6ce),
      "name": "Lemon",
      "image": "assets/images/lemon.png",
      "weight": "\$1.50/Kg",
    },
    {
      "bg": Color(0xfff8edc5),
      "name": "Mango",
      "image": "assets/images/mango.png",
      "weight": "\$1.50/Kg",
    },
    {
      "bg": Color(0xfffddadc),
      "name": "Orange",
      "image": "assets/images/orange.png",
      "weight": "\$1.50/Kg",
    },
    {
      "bg": Color(0xfff5dff8),
      "name": "Strawberry",
      "image": "assets/images/strawberry.png",
      "weight": "\$1.50/Kg",
    },
  ];

  Widget buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: _iconColor),
        // onPressed: () => Navigator.of(context).pop(),
      ),
      actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.search, color: _iconColor),
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: _iconColor),
        ),
      ],
    );
  }

  Widget buildCategories() {
    return Container(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (BuildContext ctxt, int index) {
          var item = menus[index];

          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
              color: item['bg'],
            ),
            margin: EdgeInsets.only(top: 5, left: 15, right: 5, bottom: 5),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(item['name']),
          );
        }
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "Most Popular Items", 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "90 Products",
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGrid(width, height) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: (width / height),                  
                ),
                itemCount: fruits.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  var item = fruits[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: item['bg'],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: Color(0xffeff7fd),
                            ),
                            width: 40,
                            height: 40,
                            child: Icon(Icons.favorite_border, color: Color(0xffb6bcb0)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            item['image'],
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color(0xffeff7fd),
                            ),
                            width: 40,
                            height: 40,
                            child: Icon(Icons.add, color: Color(0xffb6bcb0)),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 10,
                          right: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  item['weight'],
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
      flex: 1,
    );
  }

  Widget buildTabbar() {
    return SizedBox(
      height: 75,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Icon(Icons.home, color: _iconColor),
            ),
            Expanded(
              child: Icon(Icons.search, color: _iconColor),
            ),
            Expanded(
              child: Icon(Icons.border_all, color: _iconColor),
            ),
            Expanded(
              child: Icon(Icons.people, color: _iconColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) * 0.4;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        children: <Widget>[
          buildCategories(),
          buildTitle(),
          buildGrid(itemWidth, itemHeight),
          buildTabbar(),
        ],
      ),
    );
  }
}
