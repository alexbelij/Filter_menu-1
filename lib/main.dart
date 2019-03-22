import 'package:flutter/material.dart';
import 'package:filter_menu/diagonal_clipper.dart';
import 'package:filter_menu/initial_task_list.dart';
import 'package:filter_menu/task_row.dart';
import 'package:filter_menu/list_model.dart';
import 'package:filter_menu/animated_fab.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  ListModel listModel;
  bool showOnlyCompleted = false;

  @override
  void initState() {
    super.initState();
    listModel = new ListModel(_listKey, tasks);
  }

  double _imageHeight = 256.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _buildTimeline(),
          _buildIamge(),
          _buildTopHeader(),
           _buildProfileRow(),
           _buildBottomPart(),
           _buildFab(),
        ],
      ),
    );
  }

//Top Image widget

  Widget _buildIamge() {
  return new ClipPath(
    clipper: new DialogonalClipper(),
    child: new Image.asset(
        'assets/images/AV-Team.png',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
    ),
  );
}

//Header widget

Widget _buildTopHeader() {
  return new Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
    child: new Row(
      children: <Widget>[
        new Icon(Icons.menu, size: 32.0, color: Colors.white),
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              "Timeline",
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        new Icon(Icons.linear_scale, color: Colors.white),
      ],
    ),
  );
}

// Profile row widget
Widget _buildProfileRow() {
  return new Padding(
    padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
    child: new Row(
      children: <Widget>[
        new CircleAvatar(
          minRadius: 28.0,
          maxRadius: 28.0,
          backgroundImage: new AssetImage('assets/images/agent-barton.jpg'),
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                'Clinton F. Barton',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              new Text(
                'S.H.I.E.L.D Agent | founding member of Avengers',
                style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
// Table content

Widget _buildBottomPart() {
  return new Padding(
    padding: new EdgeInsets.only(top: _imageHeight),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildMyTasksHeader(),
        _buildTasksList(),
      ],
    ),
  );
}

//TODO
Widget _buildTasksList() {
    return new Expanded(
      child: new AnimatedList(
        initialItemCount: tasks.length,
        key: _listKey,
        itemBuilder: (context, index, animation) {
          return new TaskRow(
            task: listModel[index],
            animation: animation,
          );
        },
      ),
    );
  }

Widget _buildMyTasksHeader() {
  return new Padding(
    padding: new EdgeInsets.only(left: 64.0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          'Tasks',
          style: new TextStyle(fontSize: 30.0),
        ),
        new Text(
          'MARCH 22, 2018',
          style: new TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
      ],
    ),
  );
}
//Round button
Widget _buildFab() {
    return new Positioned(
      top: _imageHeight - 105.0,
      right: 0.0,
      child:new AnimatedFab(
        onClick: _changeFilterState,
      )
    );
  }

  void _changeFilterState() {
    showOnlyCompleted = !showOnlyCompleted;
    tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
    });
  }


// Timeline
Widget _buildTimeline() {
    return new Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: new Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }


// End of class _MainPageState
}
