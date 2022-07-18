// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:foodcourtapp/pages/home/components/home_product.dart';
import 'package:foodcourtapp/models/category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,8,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Stores for you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1,
                ),
                ),
                TextButton(
                  child: Text('View all..', style: TextStyle(fontSize: 12),),
                  onPressed: (){},
                    ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,8,8),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: FirestoreListView<Category>(
                        scrollDirection: Axis.horizontal,
                      query: categoryCollection,
                      itemBuilder: (context, snapshot) {
                        Category category = snapshot.data();
                        return Padding(
                              padding: const EdgeInsets.only(right: 6),
                                  child: ActionChip(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    backgroundColor: Colors.grey.shade500,
                                    label: Text(
                                      category.catName!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: _selectedCategory==category.catName ? Colors.black26 : Colors.white),
                                    ),
                                    onPressed: (){
                                      print(category.catName);
                                      setState(() {
                                        _selectedCategory = category.catName;
                                      });
                                      },
                                  ),
                        );
                      },
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    child: IconButton(
                        onPressed: (){
                        },
                        icon: const Icon(Icons.arrow_downward),
                        ),
                  )
                ],
              ),

            ),
          ),
          const Padding(
            padding: const EdgeInsets.fromLTRB(20,0,8,0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('All of the food',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1,
                ),
              ),
            ),
          ),
          //productList
          HomeProductList(
            category: _selectedCategory,
          )
        ],
      ),
    );

  }
}
