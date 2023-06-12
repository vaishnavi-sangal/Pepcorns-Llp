import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.pink,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login/Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Sign Up'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  // const SignUp({Key? key}) : super(key: key);
  TextEditingController _email = new TextEditingController();

  TextEditingController _password = new TextEditingController();
  Future<void> signup(context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
    } catch (e) {
      print(e);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
              controller: _email,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
              controller: _password,
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                signup(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  // const SignIn({Key? key}) : super(key: key);
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  Future<void> signin(BuildContext context) async {
    bool j = false;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text);
      print('signed in');
      j = true;
    } catch (e) {
      j = false;

      print(e);
    }
    if (j == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage2()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
              controller: _email,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
              controller: _password,
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                signin(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Finance App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fetchStockData().then((stockData) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StockDataPage(stockData: stockData),
                ),
              );
            });
          },
          child: Text('Get Stock Market Data'),
        ),
      ),
    );
  }

  Future<List<String>> fetchStockData() async {
    // Call the Alpha Vantage API to fetch stock market data (replace with your own API implementation)
    final apiKey = 'VVO319M2HAPB6MAA';
    final response = await http.get(
      Uri.parse(
          'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=$apiKey'),
    );
    print(response);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final stockData = jsonData['Time Series (5min)'];

      List<String> formattedData = [];

      stockData.forEach((key, value) {
        String formattedItem =
            'Timestamp: $key\nOpen: ${value['1. open']}\nHigh: ${value['2. high']}\nLow: ${value['3. low']}\nClose: ${value['4. close']}\nVolume: ${value['5. volume']}\n';
        formattedData.add(formattedItem);
      });

      return formattedData;
    } else {
      throw Exception('Failed to fetch stock data.');
    }
  }
}

class PomePage extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          padding: EdgeInsets.fromLTRB(80, 290, 20, 160),
          child: Text(
            'Wrong Crendential',
            style: TextStyle(fontSize: 50),
          )),
    );
  }
}

class StockDataPage extends StatelessWidget {
  final List<String> stockData;

  StockDataPage({required this.stockData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Market Data'),
      ),
      body: ListView.builder(
        itemCount: stockData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stockData[index]),
          );
        },
      ),
    );
  }
}
