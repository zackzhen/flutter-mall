import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/TabHome.dart';
import 'package:flutter_app/config/index.dart';
import 'package:flutter_app/config/string.dart';
import 'package:flutter_app/pages/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: KString.app_name),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0; //页面起始
  late PageController _pageController =
      PageController(initialPage: this._pageIndex);

  static const platform = const MethodChannel("zack.zack.team");
  String _channelResult = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Hello"),
        //   centerTitle: true,
        // ),
        body: PageView(
          controller: _pageController,
          children: [
            Container(
              child: ListView(
                children: [
                  RaisedButton(

                    onPressed: () async {
                      String result =
                      await platform.invokeMethod("jumpActivity");
                      setState(() {
                        this._channelResult = result;
                      });
                    },
                    child: Text("跳转原生页面"),
                  ),
                  Text(this._channelResult),
                  ElevatedButton(
                    onPressed: () async {
                      await platform.invokeMethod("toastMsg");
                    },
                    child: Text("调用 Toast 提示"),
                  ),
                ],
              ),
            ),
            // Container(
            //   child: Text(
            //     "two",
            //     style: TextStyle(fontSize: 100, fontWeight: FontWeight.w200),
            //   ),
            // ),
            LoginView(),
            Container(
              // child: Text(
              //   "three",
              //   style: TextStyle(fontSize: 100, fontWeight: FontWeight.w200),
              // ),
              alignment:Alignment.center,
              child: Wrap(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 150, 20, 20),
                      alignment: Alignment.center,
                      width: 100.0,
                      height: 36.0,
                      color: Colors.blueGrey,
                      child: Text('历史记录1'),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 150, 20, 20),
                      alignment: Alignment.center,
                      width: 100.0,
                      height: 36.0,
                      color: Colors.blue,
                      child: Text('历史记录2'),
                    ),
                  )
                ],
              ),
            ),
            // TabHome(),
          ],
        ),
        bottomNavigationBar: getBottomView());
  }

  Widget getBottomView() {
    return BottomNavigationBar(
        currentIndex: this._pageIndex,
        onTap: (index) {
          setState(() {
            this._pageIndex = index;
            print('$index -index');
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.lightBlueAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的")
        ]);
  }
}
