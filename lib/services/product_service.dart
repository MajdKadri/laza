import 'package:dio/dio.dart';
import 'package:laza/Model/products.dart';

class ProductService {
  Dio dio = Dio();
  String baseurl = ("https://dummyjson.com/products");

    late  Response response ;
}

abstract class ProductServiceImp extends ProductService {

dynamic getallproducts();
  dynamic getoneproduct(int id);

}

class ProductServiceGet extends ProductServiceImp {

   @override
  getallproducts() async {

    try {
      response = await dio.get(baseurl);
      if (response.statusCode==200) {
        List<Products> products_list = await List.generate(
            response.data['products'].length, (index) {
          return Products.fromMap(response.data['products'][index],);
        });

        return products_list;
      }else
        return false;
    }catch(e){
      return false ;
    }
    }


  @override
dynamic  getoneproduct(num id) async {
   response=await dio.get('https://dummyjson.com/products/${id}');
   Products product = Products.fromMap(response.data);
   return product ;
  }


}
