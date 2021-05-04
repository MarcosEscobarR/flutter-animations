import 'package:disenhos/widgets/pinteres_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => new _ScrollProvider(),
        child: Stack(
          children: [
            PinterestGrid(),
            PinterestMenuProstioned(),
          ],
        ),
      ),
    );
  }
}

class PinterestMenuProstioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_ScrollProvider>(context).mostrar;

    return Positioned(
        bottom: 30,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Align(child: PinteresMenu(mostrar: mostrar))));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final items = List.generate(200, (index) => index);

  ScrollController scrollController = new ScrollController();
  double scrollAnterior = 0;
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > scrollAnterior &&
          scrollController.offset > 150.0) {
        Provider.of<_ScrollProvider>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_ScrollProvider>(context, listen: false).mostrar = true;
      }
      scrollAnterior = scrollController.offset;
      print(this.scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    this.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final index;
  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _ScrollProvider extends ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool val) {
    this._mostrar = val;
    notifyListeners();
  }
}
