// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:foodcourtapp/category/product_category_widget.dart';
// import 'package:foodcourtapp/models/category_model.dart';
import '../models/main_category_model.dart';

class MainCategoryWidget extends StatefulWidget {
  final String? selectedCat;
  const MainCategoryWidget({this.selectedCat,Key? key}) : super(key: key);

  @override
  State<MainCategoryWidget> createState() => _MainCategoryWidgetState();
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  GlobalKey<_MainCategoryWidgetState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirestoreListView<MainCategory>(
                        query: mainCategoryCollection(widget.selectedCat),
                        itemBuilder: (context, snapshot) {
                          MainCategory mainCategory = snapshot.data();
                          // debugPrint("data Firestore: ${mainCategory.mainCategory}");
                          return SizedBox(
                            height: 200,
                            child: new ExpansionTile(
                              initiallyExpanded: false,
                              key: _key,
                              title: Text(mainCategory.mainCategory!),
                              children: <Widget>[
                              SubCategoryWidget(selectedSubCat: mainCategory.mainCategory,),
                             ],

                              // leading: Icon(Icons.all_inclusive),
                            ),
                          );
                        },
                      ),
    );
  }
}
