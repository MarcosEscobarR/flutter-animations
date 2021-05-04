import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EmergencyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _HeaderBackground(),
        Positioned(
            top: -50,
            left: -70,
            child:
            FaIcon(FontAwesomeIcons.plus, size: 250, color: Colors.white.withOpacity(0.20),)
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity,),
            Text('Haz solicitado', style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            Text('Asistencia Medica', style: TextStyle(fontSize: 20, color: Colors.white),),
            SizedBox(height: 15,),
            FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white,)

          ],
        )
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xff526bF6),
                Color(0xff67ACD2)
              ]
          )
      ),
    );
  }
}

class FatButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final FatButtonDataModel data = Provider.of<FatButtonProvider>(context).data;

    return Stack(children: [
      _FatButtonBackground(icon: data.icon,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100, width: 40,),
          FaIcon(data.icon, color: Colors.white, size: 40,),
          SizedBox(width: 20,),
          Expanded(child: Text(data.text, style: TextStyle(color: Colors.white, fontSize: 18),)),
          FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
          SizedBox(width: 20,),
        ],
      )
    ],);
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;

  const _FatButtonBackground({@required this.icon});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
                child: FaIcon(data.icon, color: Colors.white.withOpacity(0.2), size: 150,)
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(6,4), blurRadius: 10)
        ],
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xfff6989F5),
            Color(0xff906EF5),
          ]
        )
      ),
    );
  }
}

class FatButtonDataModel {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function function;

  FatButtonDataModel(this.icon, this.text, this.color1, this.color2, this.function);
}

class FatButtonProvider extends ChangeNotifier{
  FatButtonDataModel _data;

  FatButtonDataModel get data() => this._data;

  set data(FatButtonDataModel val) {
    this._data = val;
  }

}
