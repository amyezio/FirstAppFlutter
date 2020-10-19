import 'package:flutter/material.dart';
import 'package:hello_world/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MaterialApp(
  home: UserInfo(),
));

class UserInfo extends StatefulWidget {

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo>{

  List<User> _listUser = listLoad();


  int _sizeOf(){
    return _listUser.length;
  }

  void _addFive(){
    setState(() {
      int size = _sizeOf();
      int i, j;
      for (i = 0; i < 5 ; ++i){
        j = i+1+size;
        _listUser.add(new User( "User $j", "user$j@gmail.com"));
      }
    });
  }

  Text _textSize(){
    int size = _sizeOf();
    return Text("Number of size $size");
  }

  void _deleteFive(){
    setState(() {
      int size = _sizeOf();
      print (size);
      if (size!=0) {
        int i, j;
        for (i = 0; i < 5; ++i) {
          j = size - i - 1;
          _listUser.removeAt(j);
        }
      }
      else {
        print ("Show toast");
        Fluttertoast.showToast(
            msg: 'User list is empty',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App VD"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 14,
            child: ListView.builder(
              itemCount: _listUser.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    title: Text(_listUser[index].name),
                    subtitle: Text(_listUser[index].email),
                  ),
                );},
            ),
          ),
          Expanded(
            flex: 1,
              child:Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: _textSize()
              )
          ),
          Expanded(
            flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: RaisedButton.icon(
                          onPressed: () {
                            _addFive();
                          },
                          icon: Icon(
                              Icons.add),
                          label: Text("Add 5"),
                          color: Colors.green[850],
                        ),
                      ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton.icon(
                        onPressed: () {
                          _deleteFive();
                        },
                        icon: Icon(
                            Icons.remove),
                        label: Text("Remove 5"),
                        color: Colors.red[800],
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
      )
    );
  }

  static List<User> listLoad() {
    List<User> list = new List<User>();
    int j, i;
    for (i = 0 ; i < 10 ; ++i){
      j = i+1;
      list.add(new User( "User $j", "user$j@gmail.com"));
    }
    return list;
  }
}