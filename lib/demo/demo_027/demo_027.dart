
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
//这是一个原声端动态跳转到flutter页面的的例子，核心思想
// Navigator.pushReplacementNamed(context, value); 使用替换路由
//加MethodChannel通信

//下面是 原声短的核心代码



// public class RouteApplication extends Application {
//   private static final String TAG = "RouteApplication";
//
//   public static final String CACHE_ENGINE = "cache_engine";
//   private static final String CHANNEL_NAME = "test_channel";
//
//   @Override
//   public void onCreate() {
//     super.onCreate();
//     FlutterEngine engine = new FlutterEngine(this);
//     engine.getDartExecutor().executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault());
//     FlutterEngineCache.getInstance()
//         .put(CACHE_ENGINE, engine);
//     MethodChannel channel = new MethodChannel(engine.getDartExecutor(), CHANNEL_NAME);
//     channel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
//     @Override
//     public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
//     Log.d(TAG, "onMethodCall: " +call.toString());
//     if (call.method.equals("route_name")) {
//     result.success("/list_page");
//     }
//     }
//     });
//   }
// }


//下面是原声端调用的核心代码

// findViewById(R.id.tv_cache).setOnClickListener(v -> {
// startActivity( FlutterActivity.withCachedEngine(RouteApplication.CACHE_ENGINE)
//     .build(this));
// });
// findViewById(R.id.tv_hero).setOnClickListener(v -> {
// startActivity(FlutterActivity.withNewEngine()
//     .initialRoute("/hero_page")
//     .build(this));
// });
//
// findViewById(R.id.tv_list).setOnClickListener(v -> {
// startActivity(FlutterActivity.withNewEngine()
//     .initialRoute("/list_page")
//     .build(this));
// });
// }




class MyApp extends StatelessWidget {
  build(context) => MaterialApp(
    // home: MyHomePage(),
    initialRoute: MyHomePage.routeName,
    routes: {
      MyHomePage.routeName: (context) => MyHomePage(),
      HeroWidgetPage.routeName: (context) => HeroWidgetPage(),
      ListPage.routeName: (context) => ListPage(),
      HomePage.pageRoute: (context) => HomePage()
    },
    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("hero animation"),
    ),
    body: MyHomeContent(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  static const MethodChannel _channel = MethodChannel("test_channel");
  @override
  void initState() {
    super.initState();
    Future<String> result = _channel.invokeMethod<String>("route_name");

    result.then((value) {
      print(value);
      Navigator.pushReplacementNamed(context, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, HeroWidgetPage.routeName);
            },
            child: Text("go hero page")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ListPage.routeName);
            },
            child: Text("go list ipage")),
      ],
    );
  }
}


class HeroWidgetPage extends StatelessWidget {
  static const routeName = "/hero_page";
  const HeroWidgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //实现交织动画
    return Scaffold(
      appBar: AppBar(
        title: Text("stragered grid"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            String url = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
              //使用hero包裹需要做动画的widget，设置hero的tag属性，跳转页面要设置相同的tag值
              child: Hero(
                child: Image.network(url),
                tag: url,
              ),
              onTap: () {
                //使用PageRouteBuilder 是因为跳转页面有一个渐变效果，如果使用MaterialPageRoute，会有一个突兀效果
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            FadeTransition(
                              opacity: animation1,
                              child: HeroPage(
                                url: url,
                              ),
                            )));
              },
            );
          }),
    );
  }
}


class HeroPage extends StatelessWidget {
  final String url;

  const HeroPage({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          //需要做动画的widget使用Hero包裹，设置tag相同的属性
          child: Hero(
            tag: url,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  static const pageRoute = "/home_page";
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
        child: Text("home page"),
      ),
    );
  }
}


class ListPage extends StatelessWidget {
  static const routeName = "/list_page";
  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list view "),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              radius: 10.0,
              child: Image.network(
                  "https://picsum.photos/50/50?random=$index"),
            ),
            title: Text("title $index"),
            subtitle: Text("sub title $index"),
          )),
    );
  }
}



