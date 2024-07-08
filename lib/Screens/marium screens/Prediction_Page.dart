import 'package:flutter/material.dart';

import 'function.dart';

class predictionPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const predictionPage({Key? key, required this.data}) : super(key: key);

  @override
  State<predictionPage> createState() => _predictionPageState();
}

class _predictionPageState extends State<predictionPage> {
  String result = '';
  void getPrediction() async {
    /*final inputData = {
      "BMI": [19.3],
      "Cycle(R/I)": [2],
      "Cycle length(days)": [5],
      "Pregnant(Y/N)": [0],
      "No. of aborptions": [0],
      "Hip(inch)": [36],
      "Waist(inch)": [30],
      "Waist:Hip Ratio": [0.833333],
      "Weight gain(Y/N)": [0],
      "hair growth(Y/N)": [0],
      "Skin darkening (Y/N)": [0],
      "Pimples(Y/N)": [0],
      "Fast food (Y/N)": [1],
      "Follicle No. (L)": [3],
      "Follicle No. (R)": [3]
    };*/
    final inputData = {
      "BMI": [widget.data[""]],
      "Cycle(R/I)": [widget.data[""]],
      "Cycle length(days)": [widget.data[""]],
      "Pregnant(Y/N)": [widget.data[""]],
      "No. of aborptions": [widget.data[""]],
      "Hip(inch)": [widget.data[""]],
      "Waist(inch)": [widget.data[""]],
      "Waist:Hip Ratio": [widget.data[""]],
      "Weight gain(Y/N)": [widget.data[""]],
      "hair growth(Y/N)": [widget.data[""]],
      "Skin darkening (Y/N)": [widget.data[""]],
      "Pimples(Y/N)": [widget.data[""]],
      "Fast food (Y/N)": [widget.data["fastfood"]],
      "Follicle No. (L)": [widget.data["folliclesL"]],
      "Follicle No. (R)": [widget.data["folliclesR"]]
    };

    try {
      final response = await fetchPrediction(inputData);
      setState(() {
        result = response['PCOS_Y/N'].toString();
      });
    } catch (e) {
      setState(() {
        result = 'Failed to load prediction';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PCOS Prediction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(result.isEmpty ? 'Press the button to get prediction' : 'Prediction: $result'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getPrediction,
              child: Text('Get Prediction'),
            ),
          ],
        ),
      ),
    );
  }
}