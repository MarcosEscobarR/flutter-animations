import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinteresButton {
  final Function onPress;
  final IconData icon;

  PinteresButton(this.onPress, this.icon);
}

class PinteresMenu extends StatelessWidget {
  final bool mostrar;
  PinteresMenu({this.mostrar});
  final List<PinteresButton> items = [
    PinteresButton(() {
      print('icono1');
    }, Icons.pie_chart),
    PinteresButton(() {
      print('icono2');
    }, Icons.search),
    PinteresButton(() {
      print('icono3');
    }, Icons.notifications),
    PinteresButton(() {
      print('icono3');
    }, Icons.supervised_user_circle),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ChangeNotifierProvider(
            create: (_) => new _MenuProvider(),
            child: AnimatedOpacity(
                duration: Duration(microseconds: 2000),
                opacity: (mostrar) ? 1 : 0,
                child: _PinteresMenuBackground(child: _MenuItems(items)))));
  }
}

class _PinteresMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinteresMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinteresButton> items;

  const _MenuItems(this.items);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            items.length, (i) => _PinteresMenuButton(i, items[i])));
  }
}

class _PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinteresButton item;

  const _PinteresMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccioado =
        Provider.of<_MenuProvider>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuProvider>(context, listen: false).itemSeleccionado =
            index;

        item.onPress();
      },
      child: Container(
        child: Icon(
          item.icon,
          size: itemSeleccioado == index ? 35 : 25,
          color: itemSeleccioado == index ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuProvider extends ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int val) {
    this._itemSeleccionado = val;
    notifyListeners();
  }
}
