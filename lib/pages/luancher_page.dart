import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenhos/Routes/Routes.dart';

class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Disenhos en Flutter')),
      ),
      body: _MenuOptions(),
      drawer: _MenuDrawer(),
    );
  }
}

class _MenuOptions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, i) => Divider(
              color: Colors.blue,
            ),
        itemCount: pageRoutes.length,
        itemBuilder: (context, i) =>
            ListTile(
              title: Text(pageRoutes[i].title),
              leading: FaIcon(
                pageRoutes[i].icon,
                color: Colors.blue,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
              },
            ));
  }
}

class _MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                'ME',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Expanded(child: _MenuOptions()),
          ListTile(
            title: Text('Cambiar de Tema'),
            leading: Icon(
              Icons.lightbulb_outline,
              color: Colors.blue,
            ),
            trailing: Switch.adaptive(value: true, onChanged: (value) {}),
          ),
          ListTile(
            title: Text('Tema Custom '),
            leading: Icon(
              Icons.add_to_home_screen_outlined,
              color: Colors.blue,
            ),
            trailing: Switch.adaptive(value: true, onChanged: (value) {}),
          )
        ],
      ),
    ));
  }
}
