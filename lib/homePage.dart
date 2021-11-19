import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/categories_model.dart';
import 'package:food_app/models/foodcategory_model.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/screen/categories.dart';
import 'package:food_app/screen/detail_page.dart';
import 'package:food_app/screen/widgets/bottom_container.dart';
import 'package:provider/provider.dart';

import 'models/food_model.dart';

class homePage extends StatefulWidget {
  /*const homePage({Key? key}) : super(key: key);*/

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  //****************UpperCategory*************************//
  List<CategoriesModel> burgerList=[];
  List<CategoriesModel> bbqList=[];
  List<CategoriesModel> chikenList=[];
  List<CategoriesModel> pizzaList=[];
  List<CategoriesModel> riceList=[];

  //******************FoodCategory******************//
  List<FoodModel> singlefoodList=[];

  //*****************food Category Type**************//
  //*Burger**//
  List<FoodCategoryModel> burgerCategoryList=[];
  //*Pizza**//
  List<FoodCategoryModel> pizzaCategoryList=[];
  //*Bbq**//
  List<FoodCategoryModel> bbqCategoryList=[];
  //*Rice**//
  List<FoodCategoryModel> riceCategoryList=[];

  Widget upperCategoery({@required Function onTap,@required String image,@required String name}){
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 20.0,top: 10.0),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                  image: NetworkImage(image)
              ),
              color: Color(0xff3a3e3e3e),
            ),
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

  // Widget buttonCategory({@required String image,@required String name, @required int price}){
  //   return Container(
  //     margin: EdgeInsets.only(top: 10.0),
  //     height: 200.0,
  //     width: 200.0,
  //     decoration: BoxDecoration(
  //       color: Color(0xff3a3e3e3e),
  //       borderRadius: BorderRadius.circular(40.0),
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(top: 8.0),
  //           child: CircleAvatar(
  //             backgroundImage: NetworkImage(image),
  //             radius: 60.0,
  //           ),
  //         ),
  //         ListTile(
  //           leading: Text(
  //             name,
  //             style: TextStyle(
  //                 fontSize: 25.0,
  //                 color: Colors.white
  //             ),
  //           ),
  //           trailing: Text(
  //             "\$ $price",
  //             style: TextStyle(
  //               fontSize: 20.0,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 15.0),
  //           child: Row(
  //             children: [
  //               Icon(
  //                 Icons.star,
  //                 size: 20.0,
  //                 color: Colors.white,
  //               ),
  //               Icon(
  //                 Icons.star,
  //                 size: 20.0,
  //                 color: Colors.white,
  //               ),
  //               Icon(
  //                 Icons.star,
  //                 size: 20.0,
  //                 color: Colors.white,
  //               ),
  //               Icon(
  //                 Icons.star,
  //                 size: 20.0,
  //                 color: Colors.white,
  //               ),
  //               Icon(
  //                 Icons.star,
  //                 size: 20.0,
  //                 color: Colors.white,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget drawerItems({@required String title,@required IconData icon}){
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      trailing: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

  //****************Burger*******************//
  Widget burger(){
    return Row(
      children: burgerList.map((e) => upperCategoery(
        image: e.image,
        name: e.name,
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>foodCategory(list: burgerCategoryList,),),);
        }
      )).toList(),
    );
  }
//****************Bbq*******************//
  Widget bbq(){
    return Row(
      children: bbqList.map((e) => upperCategoery(
        image: e.image,
        name: e.name,
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>foodCategory(list: bbqCategoryList,),),);
        }
      )).toList(),
    );
  }

  //****************Chiken*******************//
  Widget chiken(){
    return Row(
      children: chikenList.map((e) => upperCategoery(
        image: e.image,
        name: e.name,
          onTap: (){}
      )).toList(),
    );
  }

  //****************Pizza*******************//
  Widget pizza(){
    return Row(
      children: pizzaList.map((e) => upperCategoery(
        image: e.image,
        name: e.name,
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>foodCategory(list: pizzaCategoryList,),),);
          }
      )).toList(),
    );
  }

  //****************Rice*******************//
  Widget rice(){
    return Row(
      children: riceList.map((e) => upperCategoery(
        image: e.image,
        name: e.name,
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>foodCategory(list: riceCategoryList,),),);
          }
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    //****burger********//
    provider.getBurgerCategory();
    burgerList = provider.throwburgerList;

    //**********BBQ**********//
    provider.getBbqCategory();
    bbqList = provider.throwbbqList;

    //**********Chicken*********//
    provider.getChikenCategory();
   chikenList = provider.throwchikenList;

    //**********Pizza*********//
    provider.getPizzaCategory();
    pizzaList = provider.throwpizzaList;

    //**********Rice*********//
    provider.getRiceCategory();
    riceList = provider.throwriceList;

    //**********Food List *********//
    provider.getFoodList();
     singlefoodList = provider.throwFoodModelList;

    //**********Food Categories type *********//
    //**Burger**//
    provider.getBurgerCategoryList();
    burgerCategoryList = provider.throwBurgerCategoryList;

    //**Pizza**//
    provider.getPizzaCategoryList();
    pizzaCategoryList = provider.throwPizzaCategoryList;

    //**Pizza**//
    provider.getBbqCategoryList();
    bbqCategoryList = provider.throwBbqCategoryList;

    //**Pizza**//
    provider.getRiceCategoryList();
    riceCategoryList = provider.throwRiceCategoryList;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                drawerItems(
                    title:"Profile",
                    icon:Icons.book
                ),
                drawerItems(
                  title:"Cart",
                  icon:Icons.shopping_cart,
                ),
                drawerItems(
                  title:"Order",
                  icon:Icons.shop,
                ),
                drawerItems(
                  title:"About",
                  icon:Icons.book,
                ),
                Divider(
                  thickness: 3.0,
                  color: Colors.white,
                ),
                Text(
                  "Communicate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                drawerItems(
                  title:"Change",
                  icon:Icons.lock,
                ),
                drawerItems(
                  title:"Log Out",
                  icon:Icons.exit_to_app,
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
                  burger(),
                  bbq(),
                  chiken(),
                  pizza(),
                  rice(),
                  // upperCategoery(
                  //     image: 'images/burger.jpg',
                  //     name: 'Burger'
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 420,
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
                children: singlefoodList.map((e) => bottomContainer(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context)=>DetailPage(
                            image: e.image,
                            name: e.name,
                            price: e.price,
                          ),
                        ),
                      );
                    },
                    image: e.image,
                    name: e.name,
                    price: e.price
                ),

                ).toList()

                // children: [
                  // buttonCategory(
                  //   image: "images/burger.jpg",
                  //   name: "Burger",
                  //   price: 500,
                  // ),
                  //],
              ),
            ),
          ],
      ),
    );
  }
}
