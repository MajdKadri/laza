import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {super.key,
        required this.image,
        required this.name,
        required this.price});
  String image;
  String name;
  String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
          width: 160,
          height: 270,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Container(
                  alignment: Alignment.topRight,
                  width: 150,
                  height: 195,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: Image.network(image).image)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.sentiment_satisfied_alt_rounded,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: 130,
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  style: const TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 130,
                height: 14,
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          )),
    );
  }
}