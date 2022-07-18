import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:foodcourtapp/product/product_detail.dart';
import 'package:foodcourtapp/models/product_model.dart';

class HomeProductList extends StatelessWidget {
  final String? category;
  final Product? product;
  final String? productID;
  const HomeProductList({this.product,this.productID,this.category,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FirestoreQueryBuilder<Product>(
        query: productQuery(
          category: category
        ),

        builder: (context, snapshot, _) {
          // ...
          return GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1/1.5,
            ),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              // if we reached the end of the currently obtained items, we try to
              // obtain more items
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                // Tell FirestoreQueryBuilder to try to obtain more items.
                // It is safe to call this function from within the build method.
                snapshot.fetchMore();
              }

              var productIndex = snapshot.docs[index];
              Product product = productIndex.data();
              String productID = productIndex.id;


              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push (
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetail(
                            product: product,
                            productID: productID,
                          ),
                    ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[80],
                    height: 80,
                    width: 80,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              height: 60,
                              width: 80,
                              child: CachedNetworkImage(imageUrl: product.imageUrls![0], fit: BoxFit.cover,)),
                        ),
                        SizedBox(height: 10,),
                        Text(product.productName!,textAlign: TextAlign.center,style: TextStyle(fontSize: 10), maxLines: 2,),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
