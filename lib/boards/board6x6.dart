import 'package:flutter/material.dart';
import 'package:puzzle_game/grid.dart';
import 'package:puzzle_game/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Board6X6 extends StatefulWidget {
  @override
  _Board6X6State createState() => _Board6X6State();
}

class _Board6X6State extends State<Board6X6> {
  int stepCountCity = 0;
  int bestResultCity = 0;
  var city = [
    'images/city01.jpg',
    'images/city02.jpg',
    'images/city03.jpg',
    'images/city04.jpg',
    'images/city05.jpg',
    'images/city06.jpg',
    'images/city07.jpg',
    'images/city08.jpg',
    'images/city09.jpg',
    'images/city10.jpg',
    'images/city11.jpg',
    'images/city12.jpg',
    'images/city13.jpg',
    'images/city14.jpg',
    'images/city15.jpg',
    'images/city16.jpg',
    'images/city17.jpg',
    'images/city18.jpg',
    'images/city19.jpg',
    'images/city20.jpg',
    'images/city21.jpg',
    'images/city22.jpg',
    'images/city23.jpg',
    'images/city24.jpg',
    'images/city25.jpg',
    'images/city26.jpg',
    'images/city27.jpg',
    'images/city28.jpg',
    'images/city29.jpg',
    'images/city30.jpg',
    'images/city31.jpg',
    'images/city32.jpg',
    'images/city33.jpg',
    'images/city34.jpg',
    'images/city35.jpg',
    'images/city36.jpg',
  ];

  var checkListCity = [
    'images/city01.jpg',
    'images/city02.jpg',
    'images/city03.jpg',
    'images/city04.jpg',
    'images/city05.jpg',
    'images/city06.jpg',
    'images/city07.jpg',
    'images/city08.jpg',
    'images/city09.jpg',
    'images/city10.jpg',
    'images/city11.jpg',
    'images/city12.jpg',
    'images/city13.jpg',
    'images/city14.jpg',
    'images/city15.jpg',
    'images/city16.jpg',
    'images/city17.jpg',
    'images/city18.jpg',
    'images/city19.jpg',
    'images/city20.jpg',
    'images/city21.jpg',
    'images/city22.jpg',
    'images/city23.jpg',
    'images/city24.jpg',
    'images/city25.jpg',
    'images/city26.jpg',
    'images/city27.jpg',
    'images/city28.jpg',
    'images/city29.jpg',
    'images/city30.jpg',
    'images/city31.jpg',
    'images/city32.jpg',
    'images/city33.jpg',
    'images/city34.jpg',
    'images/city35.jpg',
    'images/city36.jpg',
  ];
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('city', stepCountCity);
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      bestResultCity = prefs.getInt('city') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    city.shuffle();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'City',
        ),
        backgroundColor: Color.fromARGB(255, 129, 149, 160),
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.jpg'),
          ),
        ),
        child: Column(
          children: [
            Menu(clickReset, stepCountCity, bestResultCity),
            Grid(city, size, click, 'images/city36.jpg', 6),
          ],
        ),
      ),
    );
  }

  void click(index) {
    if (index - 1 >= 0 &&
            city[index - 1] == 'images/city36.jpg' &&
            index % 6 != 0 ||
        index + 1 < 36 &&
            city[index + 1] == 'images/city36.jpg' &&
            (index + 1) % 6 != 0 ||
        (index - 6 >= 0 && city[index - 6] == 'images/city36.jpg') ||
        (index + 6 < 36 && city[index + 6] == 'images/city36.jpg')) {
      setState(() {
        city[city.indexOf('images/city36.jpg')] = city[index];
        city[index] = 'images/city36.jpg';
        stepCountCity++;
      });
    }
    checkWin(city, checkListCity);
  }

  void checkWin(List a, List b) {
    if (a.join() == b.join()) {
      if (stepCountCity < bestResultCity || bestResultCity == 0) {
        saveData();
        readData();
      }
    }
  }

  void clickReset() {
    setState(() {
      city.shuffle();
      stepCountCity = 0;
    });
  }
}
