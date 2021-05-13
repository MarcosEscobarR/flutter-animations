import 'package:disenhos/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenhos/Routes/Routes.dart';
import 'package:provider/provider.dart';

class LauncherPageTablet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Disenhos en Flutter - tablet')),
      ),
      body: _MenuOptions(),
      drawer: _MenuDrawer(),
    );
  }
}

class _MenuOptions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
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
                color: appTheme.accentColor,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: appTheme.accentColor,
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final theme = Provider.of<ThemeChanger>(context);
    return Drawer(
        child: Container(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              backgroundColor: appTheme.accentColor,
              child: Text(
                'ME',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Expanded(child: _MenuOptions()),
          ListTile(
            title: Text('Dark Mode'),
            leading: Icon(
              Icons.lightbulb_outline,
              color: appTheme.accentColor,
            ),
            trailing: Switch.adaptive(
                value: theme.darkMode,
                onChanged: (value) => theme.darkMode = value
                ),
          ),
          ListTile(
            title: Text('Custom Theme'),
            leading: Icon(
              Icons.add_to_home_screen_outlined,
              color: appTheme.accentColor,
            ),
            trailing: Switch.adaptive(
                value: theme.customMode,
                onChanged: (value)  => theme.customMode = value
                ),
          )
        ],
      ),
    ));
  }
}
