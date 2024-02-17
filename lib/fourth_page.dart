import 'package:flutter/material.dart';
import 'package:laza/Model/products.dart';
import 'package:laza/product_details.dart';
import 'package:laza/services/product_service.dart';
import 'package:laza/widgets/Brand_name.dart';
import 'package:laza/widgets/arrow_back_button.dart';
import 'package:laza/widgets/product_widget.dart';

class FourthPage extends StatelessWidget {
  FourthPage({super.key});

  Map brands = {
    'Adidas': 'assets/images/Adidas.png',
    'Nike': 'assets/images/nike.png',
    'Fila': 'assets/images/fila.png',
    'Puma': 'assets/images/puma.png'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ProductServiceGet().getallproducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data as List<Products>;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ArrowBackButton(
                          iconwidget: const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 25,
                      )),
                      ArrowBackButton(
                          iconwidget: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 30,
                      ))
                    ],
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 15, top: 20, bottom: 20),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.21,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Welcome to Laza.',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 275,
                          child: TextField(
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate: SearchUtility(temp: temp));
                            },
                            decoration: InputDecoration(
                                fillColor: const Color(0xffF5F6FA),
                                filled: true,
                                hintText: 'Search...',
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search_rounded,
                                    size: 30,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: MaterialButton(
                          onPressed: () {},
                          color: const Color(0xff9775FA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.mic_none,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        height: 60,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: brands.length,
                          itemBuilder: (context, index) => BrandName(
                              image: brands.values.elementAt(index),
                              text: brands.keys.elementAt(index)),
                        )),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Arraival',
                          style: TextStyle(
                            color: Color(0xFF1D1E20),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 475,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3 / 4),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var temp = snapshot.data as List<Products>;
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
                              image: temp[index].thumbnail,
                              name: temp[index].title,
                              price: temp[index].price.toString(),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

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
          child: InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(id: filterlist[index].id),));
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
