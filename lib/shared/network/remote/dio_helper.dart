import 'package:dio/dio.dart';

class DioHelper {

  // Create Object From Dio
  static late Dio dio;

  // Initial Value For Dio
  static init()
  {
    dio = Dio(
      // Here Base Url
      BaseOptions(baseUrl:'https://newsapi.org/', receiveDataWhenStatusError: true)
    );
  }
  //Function For Get Data
   static Future<Response> getData({required String url,required Map<String,dynamic> query})
  async{
    return await dio.get(url,queryParameters: query);
  }



}