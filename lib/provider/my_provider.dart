import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/categories_model.dart';
import 'package:food_app/models/food_model.dart';

class MyProvider extends ChangeNotifier{
  List<CategoriesModel> burgerList=[];
  CategoriesModel burgerModel;
  Future<void> getBurgerCategory() async{
    List<CategoriesModel> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MEon0Yumm8vTV8s2UsJ3')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModel= CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name'],
      );
      print(burgerModel.name);
      newBurgerList.add(burgerModel);
      burgerList = newBurgerList;

    });
    notifyListeners();
  }
  get throwburgerList{
    return burgerList;
  }

  //***************************2nd Category******************************//
  List<CategoriesModel> bbqList=[];
  CategoriesModel bbqModel;
  Future<void> getBbqCategory() async{
    List<CategoriesModel> newBbqList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MEon0Yumm8vTV8s2UsJ3')
        .collection('bbq')
        .get();
    querySnapshot.docs.forEach((element) {
      bbqModel= CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(bbqModel.name);
      newBbqList.add(bbqModel);
      bbqList = newBbqList;

    });
    notifyListeners();
  }
  get throwbbqList{
    return bbqList;
  }

  //***************************3rd Category******************************//
  List<CategoriesModel> chikenList=[];
  CategoriesModel chikenModel;
  Future<void> getChikenCategory() async{
    List<CategoriesModel> newChikenList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MEon0Yumm8vTV8s2UsJ3')
        .collection('Chicken')
        .get();
    querySnapshot.docs.forEach((element) {
      chikenModel= CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(chikenModel.name);
      newChikenList.add(chikenModel);
      chikenList = newChikenList;

    });
    notifyListeners();
  }
  get throwchikenList{
    return chikenList;
  }

   //***************************4th Category******************************//
  List<CategoriesModel> pizzaList=[];
  CategoriesModel pizzaModel;
  Future<void> getPizzaCategory() async{
    List<CategoriesModel> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MEon0Yumm8vTV8s2UsJ3')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModel= CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(pizzaModel.name);
      newPizzaList.add(pizzaModel);
      pizzaList = newPizzaList;

    });
    notifyListeners();
  }
  get throwpizzaList{
    return pizzaList;
  }

  //***************************5th Category******************************//
  List<CategoriesModel> riceList=[];
  CategoriesModel riceModel;
  Future<void> getRiceCategory() async{
    List<CategoriesModel> newRiceList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MEon0Yumm8vTV8s2UsJ3')
        .collection('rice')
        .get();
    querySnapshot.docs.forEach((element) {
      riceModel= CategoriesModel(
        image: element.data()['image'],
        name: element.data()['name'],
      );
      print(riceModel.name);
      newRiceList.add(riceModel);
      riceList = newRiceList;

    });
    notifyListeners();
  }
  get throwriceList{
    return riceList;
  }

  //*****************Food Section**************************//
List<FoodModel> foodModelList = [];
  FoodModel foodModel;
  Future<void> getFoodList() async{
    List<FoodModel> newSingleFoodList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("foods").get();
    querySnapshot.docs.forEach((element) {
      foodModel = FoodModel(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newSingleFoodList.add(foodModel);
    },
    );

    foodModelList = newSingleFoodList;
    notifyListeners();

  }
  get throwFoodModelList{
    return foodModelList;
  }
}