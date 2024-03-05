import 'package:flutter/material.dart';
import 'package:laza/Model/products.dart';

import '../pages/product_details.dart';
import '../widgets/product_widget.dart';

class SearchUtility extends SearchDelegate {
  SearchUtility({required this.temp});

  List<Products> temp;

  late List filterlist;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemBuilder: (context, index) => Card(
          child: Text(temp[index].title),
        ),
        itemCount: temp.length,
      );
    } else {
      List<Products> filterlist = temp
          .where((element) => element.title.toLowerCase().startsWith(query))
          .toList();
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3 / 4),
          itemCount: filterlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        id: temp[index].id.toInt(),
                      ),
                    ));
              },
              child: ProductWidget(
                image: filterlist[index].thumbnail,
                name: filterlist[index].title,
                price: filterlist[index].price.toString(),
              ),
            );
          });
    }
  }

  @override
  Widget buildSuggestions(
      BuildContext context,
      ) {
    if (query == "") {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3 / 4),
          itemCount: temp.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        id: filterlist[index].id.toInt(),
                      ),
                    ));
              },
              child: ProductWidget(
                image: temp[index].thumbnail,
                name: temp[index].title,
                price: temp[index].price.toString(),
              ),
            );
          });
    } else {
      List<Products> filterlist = temp
          .where((element) => element.title.toLowerCase().startsWith(query))
          .toList();
      return ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetails(id: filterlist[index].id),
                  ));
            },
            child: ListTile(
                leading: Image.network(
                  filterlist[index].thumbnail,
                  width: 80,
                  height: 80,
                ),
                title: Text(filterlist[index].title)),
          ),
        ),
        itemCount: filterlist.length,
      );
    }
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }
}