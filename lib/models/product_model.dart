import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodcourtapp/services/firebase_services.dart';


class Product {
  Product(
      {
  this.productName,
  this.regularPrice,
  this.salesPrice,
  this.taxStatus,
  this.taxValue,
  this.category,
  this.mainCategory,
  this.subCategory,
  this.description,
  this.scheduleDate,
  this.sku,
  this.manageInventory,
  this.soh,
  this.reOrderLevel,
  this.brand,
  this.size,
  this.otherDetails,
  this.unit,
  this.imageUrls,
  this.seller,
  this.approved,
  this.productId
});

Product.fromJson(Map<String, Object?>json)
: this(
    productName: json['productName'] as String,
   regularPrice: json['regularPrice'] as int,
    salesPrice: json['salesPrice'] as int,
    taxStatus: json['taxStatus'] as String,
    taxValue: json['taxValue']==null ? null :json['taxValue'] ! as double,
    category: json['category'] as String,
    mainCategory: json['mainCategory'] ==null ? null :json['mainCategory'] ! as String,
    subCategory: json['subCategory'] ==null ? null :json['subCategory'] ! as String,
    description: json['description'] ==null ? null :json['description'] ! as String,
    scheduleDate: json['scheduleDate'] ==null ? null :json['scheduleDate'] ! as Timestamp,
    sku: json['sku'] ==null ? null :json['sku'] ! as String,
    manageInventory: json['manageInventory'] ==null ? null :json['manageInventory'] ! as bool,
    soh: json['soh'] ==null ? null :json['soh'] ! as int,
    reOrderLevel: json['reOrderLevel'] as int,
    brand: json['brand'] ==null ? null :json['brand'] ! as String,
    size: json['size'] ==null ? null :json['size'] ! as List,
    otherDetails: json['otherDetails'] ==null ? null :json['otherDetails'] ! as String,
    unit: json['unit'] ==null ? null :json['unit'] ! as String,
    imageUrls: json['imageUrls'] as List,
    seller: json['seller'] as Map,
    approved: json['approved'] as bool,
    // productId: json['productId'!] as bool,
);


  final String? productName;
  final int? regularPrice;
  final int? salesPrice;
  final String? taxStatus;
  final double? taxValue;
  final String? category;
  final String? mainCategory;
  final String? subCategory;
  final String? description;
  final Timestamp? scheduleDate;
  final String? sku;
  final bool? manageInventory;
  final int? soh;
  final int? reOrderLevel;
  final String? brand;
  final List? size;
  final String? otherDetails;
  final String? unit;
  final List? imageUrls;
  final Map? seller;
  final bool? approved;
  final String? productId;

  Map<String, Object?> toJson(){
    return{
      'productName':productName,
      'regularPrice':regularPrice,
      'salesPrice':salesPrice,
      'taxStatus':taxStatus,
      'taxValue':taxValue,
      'category':category,
      'mainCategory':mainCategory,
      'subCategory':subCategory,
      'description':description,
      'scheduleDate':scheduleDate,
      'sku':sku,
      'manageInventory':manageInventory,
      'soh':soh,
      'reOrderLevel':reOrderLevel,
      'brand':brand,
      'size':size,
      'otherDetails':otherDetails,
      'unit':unit,
      'imageUrls':imageUrls,
      'seller':seller,
      'approved':approved,
      'productId':productId,
    };
  }
}

productQuery({category}){
  return FirebaseFirestore.instance.collection('products').where('approved',isEqualTo: true).where('category',isEqualTo: category)
      .withConverter<Product>(
    fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
    toFirestore: (product, _) => product.toJson(),
  );
}



// FirebaseServices _services = FirebaseServices();
// productQuery(approved){
//   return FirebaseFirestore.instance.collection('products'),where('approved',isEqualto)
// }