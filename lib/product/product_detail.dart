import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final DocumentSnapshot? document;
  final Product? product;
  final String? productID;
  ProductDetail({this.product,this.productID,this.document,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(product!.productName!),
      // ),
      body: Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1,color: Colors.grey),
          ),
        ),
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
          child: Row(
            children: [
              Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 140,
                width: 130,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(document!['image'])),
                ) ,
        ),
            ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, top:  5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    document!['mainCategory'],
                                    style: TextStyle(fontSize: 10),),
                                  SizedBox(
                                    height: 6,),
                                  Text(
                                    document!['subCatName'],
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    height: 6,),
                                  Text(
                                    document!['image'],
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    height: 6,),
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width-160,
                                        padding: EdgeInsets.only(top: 10, bottom:  10, left: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.grey,
                                        ),
                                        child: Text(
                                          '1 Pcs',
                                          style: TextStyle(fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Row(
                                        children: [
                                          Text(
                                            '\Rp${document!['price']}',
                                            // toStringAsFixed(0)}',
                                            style: TextStyle(fontWeight: FontWeight.bold),),
                                          SizedBox(width: 8,),
                                          Text(
                                            '\Rp${document!['price']}',
                                                // .toStringAsFixed(0)}',
                                            style: TextStyle(decoration: TextDecoration.lineThrough,
                                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width-160,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Card(
                                        color: Colors.pink,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 30, right: 30, top: 7, bottom: 7),
                                          child: Text('Add',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white), ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      ],
    ),
    )
      )
    );
  }
}
