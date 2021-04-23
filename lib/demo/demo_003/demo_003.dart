import 'package:flutter/material.dart';

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
      title: Text("flutter demo 003"),
    ),
    body: MyHomeBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}

class MyHomeBody extends StatefulWidget {
  @override
  createState() => MyHomeBodyState();
}

class MyHomeBodyState extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    return IconDemo();
  }
}

class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //字体图标 矢量图   放大不失真
        //图标多时，占用的空间更小
        Icon(
          Icons.pets,
          size: 50,
          color: Colors.orange,
        ),
        Icon(IconData(0xe90e, fontFamily: 'MaterialIcons'), color: Colors.orange,),

        //既然是一个字题图标，就可以赋值给text 0xe90e，转化unicode编码  \ue90e
        //显示字体图标，要给定一个字体
        Text("\ue90e", style: TextStyle(fontFamily: "MaterialIcons", fontSize: 50),)
      ],
    );
  }
}

class ImageDemo extends StatelessWidget {
  String url =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F2822ba474df0615802f164b913b6da0faf2851ae9399-fcAviR_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1620880511&t=92e9d9ef5d7727a5ec58bb76fccaba0b";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(url, fit: BoxFit.cover),
        SizedBox(
          height: 10,
        ),
        Image(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
          alignment: Alignment(1, 1),
          width: 100,
          height: 50,
          color: Colors.green,
          colorBlendMode: BlendMode.colorDodge,
          repeat: ImageRepeat.repeatX,
        ),
        //Implements a least-recently-used cache of up to 1000 images, and up to 100 MB.
        FadeInImage(
          placeholder: AssetImage("assets/images/loading.gif"),
          image: NetworkImage(url),
          width: 100,
        ),
        //默认缓存1000
        Image(
          image: AssetImage("assets/images/loading.gif"),
          width: 100,
        )
      ],
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // 已经废弃使用，使用ElevatedButton代替
        RaisedButton(
          onPressed: () {},
          textColor: Colors.red,
          child: Text("Rasised Button"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Elevated Button"),
        ),
        //FlatButton已经废弃掉了，使用TextButton代替
        FlatButton(
          onPressed: () {},
          child: Text("flat button"),
        ),
        Container(
          child: TextButton(onPressed: () {}, child: Text("text button")),
          // width: double.infinity,
        ),
        TextButton(
            child: Row(
              //设置主轴上面占据最大空间，还是最小空间
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  Text("喜欢作者")
                ]),
            //设置button的形状
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.purple, style: BorderStyle.solid, width: 1),
                  borderRadius: BorderRadius.circular(8),
                )))),
        ButtonTheme(
            minWidth: 30,
            height: 150,
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            child:
            ElevatedButton(onPressed: () {}, child: Text("text button1"))),
        ButtonTheme(
            minWidth: 30,
            height: 50,
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            child: FlatButton(
              onPressed: () {},
              child: Text("text button1"),
              padding: EdgeInsets.all(0),
            ))
      ],
    );
  }
}

class TextRichDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "我是文本1"),
          TextSpan(text: "我是文本2"),
          TextSpan(text: "我是文本3"),
          WidgetSpan(child: Icon(Icons.add)),
          WidgetSpan(child: Icon(Icons.hearing))
        ])));
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "床前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。",
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          fontWeight: FontWeight.bold, letterSpacing: 10, color: Colors.red),
    );
  }
}
