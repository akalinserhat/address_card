import 'package:address_card/address_card.dart';
import 'package:demo/choose_avatar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Card Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Address Card Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _onTapMenuItem() async {
    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('True or false'),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  List<PopupMenuEntry<int>> addressCardMenuItems() {
    return [
      const PopupMenuItem(value: 0, child: Text("Edit")),
      const PopupMenuItem(value: 1, child: Text("Delete")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AddressCard(
                id: "aaa",
                title: "My Home",
                stockTitleImage: 604,
                address: "Fatih mh. Çağlayan sk. No:7",
                district: "Başiskele",
                province: "Kocaeli",
                menuItems: addressCardMenuItems(),
                onTapMenuItem: (i) => _onTapMenuItem(),
                // onTapMenuItem: (a) => onTapMenuItem(a),
              ),
              const SizedBox(
                height: 10.0,
              ),
              AddressCard(
                id: "bbb",
                stockTitleImage: 3,
                title: "My Store",
                address: "Akdurak mh. Kızılay cd. No:6",
                district: "Kandıra",
                province: "Kocaeli",
                phoneNumber: "02625512225",
                menuItems: addressCardMenuItems(),
                onTapMenuItem: (i) => _onTapMenuItem(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const ChooseAvatar(),
              // ElevatedButton(
              //     onPressed: () =>
              //         showSearch(context: context, delegate: AvatarPickup()),
              //     child: const Text("Icon Gallery")),
            ],
          ),
        ),
      ),
    );
  }
}
