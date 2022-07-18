
import 'package:flutter/material.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:foodcourtapp/models/ItemModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:foodcourtapp/models/ModelItem.dart';



class CustomSearchDelegate extends SearchDelegate {
  final searchTerms = [
    'Burger',
    'French Fries',
    'Fried Chicken',
    'Soda',
    'Juice',
    'Ice Cream',
  ];

  final recentSearch = [
    'Soda',
    'Juice',
    'Ice Cream',

  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var product in searchTerms ) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> matchQuery = [];
    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}