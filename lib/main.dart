import 'package:first_app/next_page.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title_text = '星座検出 App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: _title_text),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int num = 6;
  var scales = [5.5, 6.0, 7.0, 7.0, 20.0, 6.0];

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == num) {
        _counter = 0;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter == -1) {
        _counter = num - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(widget.title),
        backgroundColorStart: const Color(0xffe4a972),
        backgroundColorEnd: const Color(0xff9941d8),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TestImage  No.' + _counter.toString().padLeft(4, "0"),
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            Image.asset(
                'images/original/test_not_resized' + _counter.toString().padLeft(4, "0") + '.jpg',
                scale: scales[_counter],
            ),
            // Image.asset('images/original/DSCF0012.jpeg', scale: 18),

            RaisedButton(
              child: Text('検出結果を表示'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(_counter),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        width: 300.0,
        height: 100.0,
        padding: EdgeInsets.only(right: 40.0),
        // margin: EdgeInsets.only(top:20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              heroTag: "Back",
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: const [
                      Color(0xffe4a972),
                      Color(0xff9941d8),
                    ],
                  )
                ),
                child: Icon(Icons.arrow_back_outlined),
              ),
            ),

            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              heroTag: "Forward",
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: const [
                        Color(0xffe4a972),
                        Color(0xff9941d8),
                      ],
                    )
                ),
                child: Icon(Icons.arrow_forward_outlined),
              )
            ),
          ],
        ),
      ),
    );
  }
}
