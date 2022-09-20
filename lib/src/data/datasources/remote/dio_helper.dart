import 'package:dio/dio.dart';
import 'package:flutter_app1111/src/data/datasources/end_points.dart';
import 'package:flutter_app1111/src/data/datasources/local/cachehelper.dart';


class DioHelper {
  static late Dio dio;

  DioHelper() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
        }

    );
    dio = Dio(baseOptions);
  }
  static  Future<Response> postData(
      {required dynamic data,required String url}) async {
    if(url.contains('sign-up')==false && url.contains('sign-in')==false) {
      dio.options.headers.addAll({
        'Authorization':SharedPref.getData(key: 'token'),
        "Content-Length": data.files[0].value.length,
        "Accept": "application/json",});
    }
    Response response= await dio.post(
      url,
      data: data,
    );
    return response;

  }
  static Future  GetData({
    required String url,
     String? id_book,
  })async{
    Response response;
    dio.options.headers.addAll({
      'Authorization':SharedPref.getData(key:'token'),
      "Accept": "application/json",
    });
    if(id_book!=null) {
      response=await dio.get(url+'$id_book',).then((value) {
        print(SharedPref.getData(key:'token'));
        return value;
      }).catchError((error){
      print(error);
    });
    } else {
      response=(await dio.get(url,).then((value) {
       return  value;
       }).catchError((error){
         print(error);
       }));
    }
    return response;
  }
  static  Future<Response> postIncreasePoints(
      {required dynamic data,required String url}) async {
      dio.options.headers.addAll({
        'Authorization':SharedPref.getData(key: 'token'),
        "Accept": "application/json",});
    Response response= await dio.post(
      url,
      data: data,
    ).then((value) {
      return value;
    }).catchError((error){
      print(error.toString());
    });
    return response;

  }
  static Future  GetSerch({
    required String url,
    String? titles,
  })async{
    Response response;
    dio.options.headers.addAll({
      'Authorization':SharedPref.getData(key:'token'),
      "Accept": "application/json",
    });
    if(titles!=null) {
      response=await dio.get(url+'$titles',).then((value) {
        print(SharedPref.getData(key:'token'));
        return value;
      }).catchError((error){
        print(error);
      });
    } else {
      response=(await dio.get(url,).then((value) {
        return  value;
      }).catchError((error){
        print(error);
      }));
    }
    return response;
  }
  static Future  GetProfile({
    required String url,
  })async{
    Response response;
    dio.options.headers.addAll({
      'Authorization':SharedPref.getData(key:'token'),
      "Accept": "application/json",
    });

      response=(await dio.get(url,).then((value) {
        return  value;
      }).catchError((error){
        print(error);
      }));

    return response;
  }

  static  Future<Response> postLogOut(
      {required String url}) async {
    if(url.contains('sign-up')==false && url.contains('sign-in')==false) {
      dio.options.headers.addAll({
        'Authorization':SharedPref.getData(key: 'token'),

        "Accept": "application/json",});
    }
    Response response= await dio.post(
      url,

    ).then((value) {
      return value;
    }).catchError((error){
      print(error.toString());
    });
    return response;

  }




}
