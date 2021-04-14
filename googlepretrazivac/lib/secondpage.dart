import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MojWebview.dart';
import 'SizeConfig.dart';

// ignore: camel_case_types
class secondPage extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/images/google.png'),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new IconButton(
                  icon: Icon(
                    Icons.open_in_browser,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
            ),
          ),
          Positioned(
              top: 50,
              right: 30,
              child: InkWell(
                  child: Text("Gmail"),
                  onTap: () async {
                    const url = 'https://www.klix.ba';
                    if (await canLaunch(url)) {
                      launch(
                        url,
                        forceSafariVC: false,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  })),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: SizeConfig.screenHeight * 0.2,
                  child: TextField(
                    controller: myController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pretraga',
                    ),
                  ))),
          Positioned(
            bottom: 50,
            left: 30,
            child: Text(
              "Done by Faris",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 22 : 16,
                  color: MediaQuery.of(context).size.width > 600
                      ? Colors.red
                      : Colors.blue,
                  backgroundColor: MediaQuery.of(context).size.width > 600
                      ? Colors.white
                      : Colors.amber),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 250,
            child: Center(
              child: ElevatedButton(
                  child: Text("Pretrazi"),
                  onPressed: () async {
                    var pretraga = myController.text;
                    var konacnaPretraga = "https://www.google.com/search?q=";
                    var pretrazi =
                        konacnaPretraga + pretraga.replaceAll(" ", "+");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MojWebview(pretrazi)));

                    print(pretrazi);
                    /*   if (await canLaunch(pretrazi)) {
                      launch(
                        pretrazi,
                        forceSafariVC: false,
                      );
                    } else {
                      throw 'Could not launch $pretrazi';
                    } */
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
