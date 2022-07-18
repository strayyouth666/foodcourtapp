
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodcourtapp/models/ItemModel.dart';
import 'package:get/get.dart';
import 'package:foodcourtapp/services/itemServices.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:get/get.dart';
import 'package:foodcourtapp/services/itemServices.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:foodcourtapp/category_item.dart';
// import 'package:foodcourtapp/widgets/custom_search.dart';

class HomePageController extends GetxController {
  ItemServices itemServices = ItemServices();
  List<ItemModel> items = [];
  List<ItemModel> cartItems = [];
  bool isLoading = true;
  late ItemModel item;

  @override
  void onInit() {
    super.onInit();
    loadDB();
  }

  loadDB() async {
    await itemServices.openDB();
    loadItems();
    getCardList();
  }

  getItem(int id) {
    return items.singleWhere((element) => element.id == id);
  }

  bool isAlreadyInCart(id) {
    return cartItems.indexWhere((element) => element.shopId == id) > -1;
  }

  getCardList() async {
    try {
      List list = await itemServices.getCartList();
      cartItems.clear();
      list.forEach((element) {
        cartItems.add(ItemModel.fromJson(element));
      });
        update();

    } catch(e) {
      print(e);
    }
  }

  loadItems() async {
    try {
      isLoading = true;
      update();

      List list = await itemServices.loadItems();
      list.forEach((element) {
        items.add(ItemModel.fromJson(element));
      });

      isLoading = false;
      update();

    } catch(e) {
      print(e);
    }
  }

  setToFav(int id, bool flag) async{
    int index = items.indexWhere((element) => element.id == id);


    items[index].fav = flag;
    update();
    try {
      await itemServices.setItemAsFavourite(id, flag);
    } catch(e) {
      print(e);
    }
  }

  Future addToCart(ItemModel item) async {
    isLoading = true;
    update();
    var result = await itemServices.addToCart(item);
    isLoading = false;
    update();
    return result;
  }

  removeFromCart(int shopId) async{
    itemServices.removeFromCart(shopId);
    int index = cartItems.indexWhere((element) => element.shopId == shopId);
    cartItems.removeAt(index);
    update();
  }
}



