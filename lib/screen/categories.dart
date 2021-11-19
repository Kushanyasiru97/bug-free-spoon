import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/homePage.dart';
import 'package:food_app/models/foodcategory_model.dart';
import 'package:food_app/screen/detail_page.dart';
import 'package:food_app/screen/widgets/bottom_container.dart';

class foodCategory extends StatelessWidget {
  List<FoodCategoryModel> list = [];
  foodCategory({@required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contet) => homePage()));
          },
        ),
      ),
      body: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
          children: list.map((e) => bottomContainer(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> DetailPage(
                image: e.image,
                name: e.name,
                price: e.price,
              ) ));
            },
          image: e.image,
          name: e.name,
          price: e.price
      ),

      ).toList()
      ),
    );
  }
}
