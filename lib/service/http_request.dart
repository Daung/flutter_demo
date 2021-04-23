import 'package:dio/dio.dart';
import 'package:study_flutter_003/service/config.dart';

class HttpRequest {
  static final BaseOptions _baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.Timeout);
  static final Dio _dio = Dio(_baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor inter}) async {
    //1,创建单独配置，如果有默认的header信息，也可以添加到options当中
    final options = Options(method: method);

    //全剧拦截器

    Interceptor dIter = InterceptorsWrapper(onRequest: (options, handler) {
      print("请求拦截 $options");
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("响应拦截 $response");
      return handler.next(response);
    }, onError: (DioError error, handler) {
      print("错误拦截 $error");
      return handler.next(error);
    });

    List<Interceptor> inters = [dIter];

    //请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    //统一添加到dio拦截器中去
    _dio.interceptors.addAll(inters);

    //2.发送网络请求
    try {
      Response response =
          await _dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
