import 'package:disenhos/widgets/emergency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: EmergencyHeader(),
      body: Center(
        child: ChangeNotifierProvider(
          create: (_) => new FatButtonProvider(),
          child: FatButton(
          ),
        ),
      ),
    );
  }
}
