import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: (Column(
          children: [
            Image.network(
                'https://res.smzdm.com/resources/public/img/pc_global/logo_min.png',
                height: 200,
                width: 250),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextField(
                  decoration: InputDecoration(
                // fillColor: Colors.blue.shade100, filled: true, labelText: '用户名'
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextField(
                  decoration: InputDecoration(
                // fillColor: Colors.blue.shade100, filled: true, labelText: '密码'
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              )),
            ),
            // TextButton(onPressed: () {},
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.resolveWith((states) {
            //         //设置按下时的背景颜色
            //         if (states.contains(MaterialState.pressed)) {
            //           return Colors.blue[200];
            //         }
            //         //默认不使用背景颜色
            //         return Colors.blue[100];
            //       }),
            //     ),
            //
            //     child: Text('登录')),

            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: MaterialButton(
                  onPressed: () {
                    print("EdgeInsets");
                  },
                  minWidth: 400,
                  height: 45,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text('登录')),
            )
            // ClipRRect(
            //   child: Container(
            //     margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            //     alignment: Alignment.center,
            //     width: 400,
            //     height: 45.0,
            //     color: Colors.blue,
            //     child: Text('登录'),
            //   ),
            // ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(5.0),
            //   child: Container(
            //     margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            //     alignment: Alignment.center,
            //     width: 400.0,
            //     height: 45.0,
            //     color: Colors.orangeAccent,
            //     child: Text(
            //       '注册',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // )
          ],
        )),
      )),
    );
  }
}
