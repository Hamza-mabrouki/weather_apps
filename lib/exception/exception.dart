import 'package:flutter/material.dart';
import 'package:weather_apps/Pages/searchpage.dart';

class Exec extends StatelessWidget {
  const Exec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Title(
              color: Colors.red, child: const Text('exception erorr !!!!!'))),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'this city not exist refrech',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchPage();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
