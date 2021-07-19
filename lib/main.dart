import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  SnackBar snackBarOption(String contentText)
  {
    return
      SnackBar(content: Text("You Click $contentText Button"));
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> _iconOption = <Icon>[
      Icon(Icons.star, semanticLabel:"star"),
      Icon(Icons.mood_bad, semanticLabel:"mood_bad"),
      Icon(Icons.wb_sunny, semanticLabel:"wb_sunny"),
      Icon(Icons.check_box, semanticLabel:"check_box")
    ];

    Widget widgetOption(_selectedIndex, context) {
      return IconButton(
          iconSize: 100,
          icon: _iconOption.elementAt(_selectedIndex),
          onPressed: () {
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context)
                .showSnackBar(snackBarOption(
                _iconOption.elementAt(_selectedIndex).semanticLabel));
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Hello example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Jen'),
                accountEmail: Text('userGmail@gmail.com'),
                currentAccountPicture: Image.asset('assets/waiting.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Item1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.headset),
                title: Text('Item2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Item3'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // This is all you need!
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Star'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mood_bad), label: 'Sad'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny), label: 'Sunny'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_box), label: 'Check Box')
          ],
          onTap: _onItemTap,
          currentIndex: _selectedIndex,
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 100,
                    child: RaisedButton(
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();

                        Scaffold.of(context).showSnackBar(
                            snackBarOption("First"));
                      },
                      child: Text('First Button'),
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Colors.deepOrange,
                    minWidth: 200.0,
                    height: 100,
                    child: RaisedButton(
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();

                        Scaffold.of(context).showSnackBar(
                            snackBarOption("Second"));
                      },
                      child: Text('Second Button'),
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Colors.deepPurple,
                    minWidth: 200.0,
                    height: 100,
                    child: RaisedButton(
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();

                        Scaffold.of(context).showSnackBar(
                            snackBarOption("Third"));
                      },
                      child: Text('Third Button'),
                    ),
                  ),
                  widgetOption(_selectedIndex, context),
                ],
              ),
            );
          },
        ));
  }
}
