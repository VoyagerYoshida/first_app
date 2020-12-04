import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


class NextPage extends StatelessWidget {
  NextPage(this._counter);
  int _counter;
  final String constellation = 'オリオン座';
  var scales = [2.0, 1.0, 1.0, 1.0, 1.0, 1.0];
  var prob = [0.7909, 0.6462, 0.6246, 0.7868, 0.6528, 0.8916];
  var iou = [0.7600, 0.5995, 0.7136, 0.5344, 0.5599, 0.3338];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text("検出結果"),
        backgroundColorStart: const Color(0xff9941d8),
        backgroundColorEnd: const Color(0xff00008B),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("星座名"),
            Text(
              constellation,
              style: TextStyle(
                fontSize: 30,
              ),
            ),

            Image.asset(
                'images/detected/outputimg' + _counter.toString().padLeft(4, "0") + '.png',
                scale: scales[_counter],
            ),

            Text("probability = " + prob[_counter].toString() + " %"),
            Text("IoU = " + iou[_counter].toString() + " %"),
          ],
        ),
      ),
    );
  }
}