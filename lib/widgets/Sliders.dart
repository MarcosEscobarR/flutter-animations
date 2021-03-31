import 'package:disenhos/models/slide_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sliders extends StatelessWidget {
  final List<Widget> slides;

  const Sliders({@required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SlidePageModel(),
      child: Center(
          child: Column(
        children: [Expanded(child: _Slides(slides)), _Dots(this.slides.length)],
      )),
    );
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
    final currentPage = Provider.of<SlidePageModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 10,
      width: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (currentPage >= index - 0.5 && currentPage <= index + 0.5)
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
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
      Provider.of<SlidePageModel>(context, listen: false).currentPage =
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
