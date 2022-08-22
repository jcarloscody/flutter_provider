import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/provider/provider_page.dart';
import 'package:providerproject/provider/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return UserModel(
          name: "josue",
          imgAvatar:
              "https://www.pockettactics.com/wp-content/sites/pockettactics/2021/07/avatar.png",
          birthDate: "25",
        );
      },
      child: MaterialApp(
        routes: {
          '/provider': (_) => ProviderPage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: const Text('Provider'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Change Notifier"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
