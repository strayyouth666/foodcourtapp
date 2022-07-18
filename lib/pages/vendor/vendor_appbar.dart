import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // var _store = Provider.of<StoreProvider>(context);

    return SliverAppBar(
      floating: true,
      snap: true,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
        onPressed: (){},
        icon: Icon(Icons.search_outlined),
        ),
      ],
    //   title: Text(
    //   // _store.selectedStore,
    //   // style:
    //   // TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    //
    // ),
    );
  }
}