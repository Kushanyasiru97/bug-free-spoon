import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  /*const homePage({Key? key}) : super(key: key);*/

  @override
  _homePageState createState() => _homePageState();
}

Widget upperCategoery({@required String image,@required String name}){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.0),
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image)
          ),
          color: Color(0xff3a3e3e3e),
        ),
      ),
      SizedBox(height: 5.0,),
      Text(
        name,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget buttonCategory({@required String image,@required String name, @required int price}){
  return Container(
    height: 250.0,
    width: 250.0,
    decoration: BoxDecoration(
      color: Color(0xff3a3e3e3e),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 60.0,
        ),
        ListTile(
          leading: Text(
            name,
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white
            ),
          ),
          trailing: Text(
            "\$ $price",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.white,
              ),
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.white,
              ),
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.white,
              ),
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.white,
              ),
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff3a3e3e3e),
          child: SafeArea(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/logo.png"),
                    ),
                  ),currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                    accountName: Text("Kushan Yasiru"),
                    accountEmail: Text('kushanyasiruwalpola@gmail.com'),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
      elevation: 0.0,
      actions: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
          backgroundImage: AssetImage('images/logo.png'),
          backgroundColor: Colors.transparent,
        ),
        ),
      ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon : Icon(Icons.search_outlined,color: Colors.white,),
                  filled: true,
                  fillColor: Color(0xff3a3e3e3e),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  )
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  upperCategoery(
                      image: 'images/burger.jpg',
                      name: 'Burger'
                  ),
                  upperCategoery(
                      image: 'images/bbq.jpg',
                      name: 'BBQ'
                  ),
                  upperCategoery(
                      image: 'images/chicken.jpg',
                      name: 'Chicken'
                  ),
                  upperCategoery(
                      image: 'images/Pizza.jpg',
                      name: 'Pizza'
                  ),
                  upperCategoery(
                      image: 'images/rice.jpg',
                      name: 'All'
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 500,
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
                children: [
                  buttonCategory(
                    image: "images/burger.jpg",
                    name: "Burger",
                    price: 500,
                  ),
                  buttonCategory(
                    image: "images/Pizza.jpg",
                    name: "Pizza",
                    price: 800,
                  ),
                  buttonCategory(
                    image: "images/rice.jpg",
                    name: "Rice",
                    price: 150,
                  ),
                  buttonCategory(
                    image: "images/chicken.jpg",
                    name: "Chicken",
                    price: 480,
                  ),
                  buttonCategory(
                    image: "images/bbq.jpg",
                    name: "BBQ",
                    price: 850,
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}
