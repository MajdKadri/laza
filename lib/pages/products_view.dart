import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/Model/products.dart';
import 'package:laza/bloc/bloc_product_bloc.dart';
import 'package:laza/pages/product_details.dart';
import 'package:laza/widgets/Brand_name.dart';
import 'package:laza/widgets/arrow_back_button.dart';
import 'package:laza/widgets/product_widget.dart';

import '../services/search_deligate.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  Map brands = {
    'Adidas': 'assets/images/Adidas.png',
    'Nike': 'assets/images/nike.png',
    'Fila': 'assets/images/fila.png',
    'Puma': 'assets/images/puma.png'
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProductBloc()..add(BlocProductsGet()),
      child: Builder(
        builder: (context) {
          return Scaffold(
              body: BlocBuilder<BlocProductBloc, BlocProductState>(
            builder: (context, state) {
              if (state is LoadingState){
          return Center(child:CircularProgressIndicator() );
              }else if (state is GetProductsSuccessfully){
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
                        padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
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
                                      delegate: SearchUtility(temp: state.products));
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
                                        borderSide:
                                        const BorderSide(color: Colors.white),
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
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 3 / 4),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          id: state.products[index].id.toInt(),
                                        ),
                                      ));
                                },
                                child: ProductWidget(
                                  image: state.products[index].thumbnail,
                                  name: state.products[index].title,
                                  price: state.products[index].price.toString(),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              } else {
                return Text('Error with getting data ');
              }
            },

          ));
        }
      ),
    );
  }
}
