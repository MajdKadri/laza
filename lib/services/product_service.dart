import 'package:dio/dio.dart';
import 'package:laza/Model/error_model.dart';
import 'package:laza/Model/products.dart';
import 'package:laza/Model/result_model.dart';

class ProductService {
  Dio dio = Dio();
  String baseurl = ("https://dummyjson.com/products");

    late  Response response ;
}

abstract class ProductServiceImp extends ProductService {
  Future<List<Resultmodel>> getallproducts();
  Future <Resultmodel> getoneproduct(int id);

}

class ProductServiceGet extends ProductServiceImp {

   @override
  Future <List<Resultmodel>> getallproducts() async {

    response = await dio.get(baseurl);
    if (response.statusCode==200) {
      List<Products> products_list = await List.generate(
          response.data['products'].length, (index) {
            return Products.fromMap(response.data['products'][index],);
          });

      return products_list;
    }else
      return [ErrorModel(message: 'Error')];
  }

  @override
  Future<Resultmodel>  getoneproduct(int id) async {
   response=await dio.get('https://dummyjson.com/products/${id}');
   Products product = Products.fromMap(response.data);
   return product ;
  }


}
