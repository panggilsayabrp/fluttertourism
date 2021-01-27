import 'package:dicoding_kemenparekraf/notifier/pariwisata_api.dart';
//import 'package:dicoding_kemenparekraf/screens/detail.dart';
import 'package:dicoding_kemenparekraf/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final thisSearch = TextEditingController();

  @override
  void initState() {
   PariwisataNotifier pariwisataNotifier = Provider.of<PariwisataNotifier>(context, listen: false);
   getPariwisata(pariwisataNotifier, "" , 'kemenparekraf');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PariwisataNotifier pariwisataNotifier = Provider.of<PariwisataNotifier>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 300.0,
                width: 500.0,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/gb3.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'What are you',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Looking for?',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextField(
                          onChanged: (key) {
                            setState(() {
                              PariwisataNotifier pariwisataNotifier = Provider.of<PariwisataNotifier>(context, listen: false);
                              getPariwisata(pariwisataNotifier, thisSearch.text, 'kemenparekraf');
                            });
                          },
                          controller: thisSearch,
                          style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey.shade700, fontSize: 15.5),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  thisSearch.clear();
                                  setState(() {
                                    PariwisataNotifier pariwisataNotifier = Provider.of<PariwisataNotifier>(context, listen: false);
                                    getPariwisata(pariwisataNotifier, "" , 'kemenparekraf');
                                  });
                                },icon: Icon(Icons.clear),
                              ),
                            filled: true,
                              fillColor: Colors.grey.shade100,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade700,
                              ),
                              hintText: "Seacrch",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.grey.shade700, fontSize: 15.5
                              ),
                              contentPadding:
                              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                              focusColor: Colors.grey.shade700,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15.0),
                                )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                controller: ScrollController(
                  initialScrollOffset: 0.0,
                  keepScrollOffset: true,
                  debugLabel: 'Tes'
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pariwisataNotifier.listDestination.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      pariwisataNotifier.selectedDestination = pariwisataNotifier.listDestination[index];
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return DetailScreen();
                          })
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
//                        color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
//                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.network(pariwisataNotifier.listDestination[index].image)
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          pariwisataNotifier.listDestination[index].name,
                                          style: TextStyle(
                                              fontSize: 19.5
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0,),
                                    Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              pariwisataNotifier.listDestination[index].location,
                                              style: TextStyle(
                                                  fontSize: 17.0
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              pariwisataNotifier.listDestination[index].timeOpen,
                                              style: TextStyle(
                                                  fontSize: 17.0
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}
