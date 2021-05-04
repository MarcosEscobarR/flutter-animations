import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sliders extends StatelessWidget {
  final List<Widget> slides;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  const Sliders(
      {@required this.slides,
      this.primaryColor,
      this.secondaryColor,
      this.primaryBullet,
      this.secondaryBullet});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _SlideShowModel(),
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideShowModel>(context).primaryColor =
                this.primaryColor;
            Provider.of<_SlideShowModel>(context).secondaryColor =
                this.secondaryColor;
            Provider.of<_SlideShowModel>(context).primaryBullet =
                this.primaryBullet;
            Provider.of<_SlideShowModel>(context).secondaryBullet =
                this.secondaryBullet;

            return Center(
                child: Column(
              children: [
                Expanded(child: _Slides(slides)),
                _Dots(this.slides.length)
              ],
            ));
          },
        ));
  }
}

class _Dots extends StatelessWidget {
  final int slidersCont;

  const _Dots(this.slidersCont);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(slidersCont, (i) => _Dot(i))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);
  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<_SlideShowModel>(context);

    double tamano;
    Color color;
    if (sliderProvider.currentPage >= index - 0.5 &&
        sliderProvider.currentPage <= index + 0.5) {
      tamano = sliderProvider.primaryBullet;
      color = sliderProvider.primaryColor;
    } else {
      tamano = sliderProvider.secondaryBullet;
      color = sliderProvider.secondaryColor;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: tamano,
      width: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;

  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double size) {
    this._primaryBullet = size;
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double size) {
    this._primaryBullet = size;
  }
}
