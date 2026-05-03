import 'package:ecommercecourse/core/function/checkinternet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var response;
  initialdata() async {
    response = await checkInternet();
    print(response);
  }

  @override
  void initState() {
    initialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test")),
      body: Center(child: Container(child: Text("Test"))),
    );
  }
}
