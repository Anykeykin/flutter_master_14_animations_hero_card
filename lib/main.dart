import 'package:flutter/material.dart';
import 'package:flutter_master_14_animations_hero_card/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {

  final String title;

  const HomeView({super.key, required this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 20,right: 20, top: 5,bottom: 10),
          itemCount: spaces.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailView(data: spaces[index]))
                );
              },
              child:
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.black12,
                    // elevation: 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Hero(
                                  tag: spaces[index].id,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    child: Image.asset(
                                      spaces[index].image,
                                      fit: BoxFit.fitWidth,
                                      ),
                                  ),
                                  ),
                              Positioned(
                                bottom: -20,
                                right: 25,
                                child: Hero(
                                  tag: '${spaces[index].id}-button',
                                  child: Material(
                                      child:Container(
                                          padding: EdgeInsets.all(10),
                                          color: Colors.amber,
                                          child: Icon(Icons.add)
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Hero(
                          tag: '${spaces[index].id}-title',
                          child: Material(
                            color: Colors.grey,
                              child:Container(
                                padding: EdgeInsets.only(left: 10, right: 20),
                                child: Text(spaces[index].description,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20))
                      ],
                    ),
                  ),


            );
          },
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  final Space data;

  const DetailView({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Stack(
                clipBehavior: Clip.none, children: [
                  Hero(
                    tag: data.id,
                    child: Image.asset(data.image),
                  ),
                  Positioned(
                    bottom: -20,
                    right: 25,
                    child: Hero(
                      tag: '${data.id}-button',
                      child: Material(
                          child:Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.amber,
                              child: Icon(Icons.add)
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Hero(
              tag: '${data.id}-title',
              child: Material(
                  child: Text(data.description)
              ),
            )
          ],
        ),
      ),
    );
  }
}