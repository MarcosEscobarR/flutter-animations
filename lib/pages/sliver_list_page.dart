import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: _Sliver(),
//      body: _ItemsList(),
      body: _SliverMenu(),
    );
  }
}

class _SliverMenu extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
            delegate: _SliverCustomHeaderDelegate(
          maxHeight: 250,
          minHeight: 200,
          child: _Sliver()
        )),
        SliverList(
          delegate: SliverChildListDelegate(items),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.maxHeight,
      @required this.minHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
     return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final Color color;

  const _ListItem(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      height: 130,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    );
  }
}

class _Sliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              'New',
              style: TextStyle(fontSize: 50, color: Color(0xff532128)),
            ),
          ),
          Stack(
            children: [
              Positioned(
                  bottom: 8,
                  child: Container(
                    width: 120,
                    height: 8,
                    color: Color(0xffF7CDD5),
                  )),
              Container(
                  child: Text('List',
                      style: TextStyle(
                          fontSize: 50,
                          color: Color(0xffD94A30),
                          fontWeight: FontWeight.bold))),
            ],
          )
        ],
      ),
    );
  }
}
