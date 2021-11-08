import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  /*const homePage({Key? key}) : super(key: key);*/

  @override
  _homePageState createState() => _homePageState();
}

Widget upperCategoery({@required String image,@required String cate}){
  return Column(
    children: [
      Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image)
          ),
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 5.0,),
      Text(
        cate,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
    ],
  );
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      leading: Icon(Icons.sort),
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
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon : Icon(Icons.search_outlined,color: Colors.white,),
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0),
              )
            ),
          ),

          Row(
            children: [
              upperCategoery(
                  image: 'images/logo.png',
                  cate: 'All'
              ),
              SizedBox(width: 5.0,),
              upperCategoery(
                  image: 'images/logo.png',
                  cate: 'All'
              ),
              SizedBox(width: 5.0,),
              upperCategoery(
                  image: 'images/logo.png',
                  cate: 'All'
              ),
              SizedBox(width: 5.0,),
              upperCategoery(
                  image: 'images/logo.png',
                  cate: 'All'
              ),
            ],
          ),
        ],
      ),
    );
  }
}
