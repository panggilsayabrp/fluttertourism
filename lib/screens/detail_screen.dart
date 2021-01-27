import 'package:dicoding_kemenparekraf/notifier/pariwisata_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PariwisataNotifier pariwisataNotifier = Provider.of<PariwisataNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(pariwisataNotifier.selectedDestination.name,
          style: TextStyle(
              fontSize: 15,
              color: Colors.black
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, color: Colors.black,), onPressed: () {
          Navigator.pop(context);
        },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image.network(pariwisataNotifier.selectedDestination.image),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3.0),
                        margin: EdgeInsets.only(left: 5.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            pariwisataNotifier.selectedDestination.name,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.0),
                            margin: EdgeInsets.only(left: 5.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                pariwisataNotifier.selectedDestination.location,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3.0),
                        margin: EdgeInsets.only(top: 3.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.green,
                            ),
                            Text(
                              pariwisataNotifier.selectedDestination.location,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
                                  child: Text(
                                    pariwisataNotifier.selectedDestination.description != null ? pariwisataNotifier.selectedDestination.description : '',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

