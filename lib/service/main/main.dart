import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_003/service/http_request.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(context) => MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatelessWidget {
  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("sliver demo"),
    ),
    body: MyHomeBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              final dio = Dio();

              dio.get("https://httpbin.org/get").then((value) => print(value));
            },
            child: Text("http get")),
        ElevatedButton(
            onPressed: () {
              final dio = Dio();

              dio
                  .post("https://httpbin.org/post")
                  .then((value) => print(value));
            },
            child: Text("http post")),
        ElevatedButton(
            onPressed: () {
              //因为设置了baseurl，所以可以简写成下面的方式
              // HttpRequest.request("https://httpbin.org/get",
              //     params: {"name": "wzy"}).then((value) {
              //   print(value);
              // });

              HttpRequest.request("/get",
                  params: {"name": "wzy"},
                  inter: InterceptorsWrapper(onRequest: (options, handler) {
                    print("接口单独请求拦截 $options");
                    return handler.next(options);
                  }, onResponse: (response, handler) {
                    print("接口单独响应拦截 $response");
                    return handler.next(response);
                  }, onError: (e, handler) {
                    return handler.next(e);
                  })).then((value) {
                print(value);
              });
            },
            child: Text("custom http")),
      ],
    );
  }
}
