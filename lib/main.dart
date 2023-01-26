import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Pay Caculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  double? res_regularPay = 0.0;
  double? res_overTimePay = 0.0;
  double? res_totalPay = 0.0;
  double? res_tax = 0.0;
  double? num1 = 0.0;
  double? num2 = 0.0;

  calculate(){
    setState((){
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      if(num1! <= 40.0){
        res_regularPay = (num1! * num2!);
        res_tax = res_regularPay!*0.18;
        res_tax = res_tax!.roundToDouble();
        res_overTimePay = 0.0;
        res_totalPay = res_regularPay;
        return;
      }else{
        res_regularPay = num1! * 40;
        res_overTimePay = (num1!-40) * num2!*1.5;
        res_totalPay = (num1!-40) * num2!*1.5+40*num2!;
      }
      res_tax = res_totalPay! * 0.18;
      res_tax = res_tax!.roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children:[
            SizedBox(
              height:20
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                labelText: "Number Of Hours",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
            SizedBox(
              height:20
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                labelText: "Hourly rate",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
            SizedBox(
              height:20
            ),
            SizedBox(
              width: double.infinity, // <-- match_parent
              child:  ElevatedButton(
                onPressed: (){
                  calculate();
                },child: Text("Calculate"),
              )
            ),
            SizedBox(
              height:20
            ),
            Text(
              "Report",
              style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            SizedBox(
              height:10
            ),
            Row(children: [
              Text(
                "Regular Pay: $res_regularPay",
                style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(
              height:10
            ),
            Row(children: [
              Text(
                "Overtime Pay: $res_overTimePay",
                style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(
              height:10
            ),
            Row(children: [
              Text(
                "Total Pay: $res_totalPay",
                style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(
              height:10
            ),
            Row(children: [
              Text(
                "Tax: $res_tax",
                style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(
              height:100
            ),
            Text(
              "Mingyuan Xie 301275467",
            style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}