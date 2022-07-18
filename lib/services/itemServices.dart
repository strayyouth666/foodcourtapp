import 'package:foodcourtapp/services/storageService.dart';

import 'package:foodcourtapp/models/ItemModel.dart';

import 'package:foodcourtapp/models/ModelItem.dart';

import 'package:foodcourtapp/services/sqlService.dart';

class ItemServices {
  SQLService sqlService = SQLService();
  StorageService storageService = StorageService();
  List<ItemModel> shoppingList = [];

  //data?
  get data => null;

  List<ItemModel> getShoppingItems() {
    int count = 1;
    data.forEach((element) {
      element['id'] = count;
      shoppingList.add(ItemModel.fromJson(element));
      count++;
    });
    return shoppingList;
  }

  List<ItemModel> get items => getShoppingItems();
  Future openDB() async {
    return await sqlService.openDB();
  }

  loadItems() async {
    bool isFirst = await isFirstTime();

    if(isFirst) {
      //Load from local DB
      List items = await getLocalDBRecord();
      return items;
    } else {
      //Save record into db & load record
      List items = await saveToLocalDB();
      return items;
    }
  }

  Future<bool> isFirstTime() async {
    return await storageService.getItem("isFirstTime") == 'true';
  }

  Future saveToLocalDB() async {
    List<ItemModel> items = this.items;
    for (var i = 0; i < items.length; i++) {
      await sqlService.saveRecord(items[i]);
    }
    storageService.setItem("isFirstTime", "true");
    return await getLocalDBRecord();
  }

  Future getLocalDBRecord() async {
    return await sqlService.getItemsRecord();
  }

  Future setItemAsFavourite(id, flag) async {
    return await sqlService.setItemAsFavourite(id, flag);
  }

  Future addToCart(ItemModel data) async {
    return await sqlService.addToCart(data);
  }

  Future getCartList() async {
    return await sqlService.getCartList();
  }

  removeFromCart(int shopId) async {
    return await sqlService.removeFromCart(shopId);
  }
}
