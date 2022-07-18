// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
// import 'package:foodcourtapp/models/category_model.dart';
import 'package:foodcourtapp/models/product_category_model.dart';
// import '../models/main_category_model.dart';

class SubCategoryWidget extends StatelessWidget {
  final String? selectedSubCat;
  const SubCategoryWidget({this.selectedSubCat, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirestoreQueryBuilder<SubCategory>(
        query: subCategoryCollection(
            selectedSubCat: selectedSubCat
        ),
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('error ${snapshot.error}');
          }

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: snapshot.docs.length==0 ? 1/.1 : 1/1.1
            ),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {

              final subCat = snapshot.docs[index].data();
              // debugPrint("data Firestore: $subCat");
              return InkWell(
                onTap: (){

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.network(subCat.image!)),
                    ),
                    Text(subCat.subCatName!,style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                    ),
                  ]
                ),
              );
              },
          );
        },
      )
    );

  }
}
