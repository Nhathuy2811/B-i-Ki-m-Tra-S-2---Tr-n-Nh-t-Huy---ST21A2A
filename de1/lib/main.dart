import 'package:flutter/material.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giải Phương Trình Bậc Nhất',
      theme: ThemeData(
        primaryColor: Colors.lightBlue, 
        hintColor: Colors.blue, 
        scaffoldBackgroundColor: Colors.white, 
      ),
      home: LinearEquationSolver(),
    );
  }
}

class LinearEquationSolver extends StatefulWidget {
  @override
  _LinearEquationSolverState createState() => _LinearEquationSolverState();
}

class _LinearEquationSolverState extends State<LinearEquationSolver> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  String _result = '';
  Color _resultColor = Colors.red; 

  void _solveEquation() {
    double a = double.tryParse(_controllerA.text) ?? 0;
    double b = double.tryParse(_controllerB.text) ?? 0;

    if (a == 0) {
      setState(() {
        _result = "Phương trình không phải là phương trình bậc nhất";
        _resultColor = Colors.red; 
      });
    } else {
      double x = -b / a;
      setState(() {
        _result = "Nghiệm của phương trình là: x = $x";
        _resultColor = Colors.black; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giải Phương Trình Bậc Nhất'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhập hệ số a'),
            ),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhập hệ số b'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _solveEquation,
              child: Text('Giải'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, 
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              _result,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );      
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }
}
