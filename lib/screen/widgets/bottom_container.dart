import 'package:flutter/material.dart';

class bottomContainer extends StatelessWidget {

  final String image;
  final String name;
  final int price;
  final Function onTap;
  bottomContainer({@required this.image,@required this.name, @required this.price, @required this.onTap});
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: Color(0xff3a3e3e3e),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 60.0,
              ),
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
      ),
    );
  }
  }
