import 'package:flutter/material.dart';
import 'package:food_app/homePage.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class cartPage extends StatelessWidget {
  //const cartPage({Key? key}) : super(key: key);
  @override
  Widget cartItem({
    @required String image,
    @required String name,
    @required int price,
    @required Function onTap,
    @required int quantity,
  }) {
    return Row(
      children: [
        Container(
          width: 170,
          height: 170,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "burger bhout acha hain",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "\$ $price",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "$quantity",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: onTap,
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int totalprice = provider.totalPrice();
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15.0,right: 15.0,left: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 65.0,
       decoration: BoxDecoration(
         color: Color(0xff3a3e3e),
         borderRadius: BorderRadius.circular(15.0),
       ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$ $totalprice',style: TextStyle(color: Colors.white,fontSize: 30.0),),
            Text("Check Out",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contet) => homePage()));
          },
        ),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return cartItem(
            onTap: (){
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}
