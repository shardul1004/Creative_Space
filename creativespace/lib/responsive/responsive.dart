import 'package:flutter/material.dart';

class responsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const responsiveLayout({Key? key, required this.webScreenLayout,required this.mobileScreenLayout}) : super(key: key);

  @override
  State<responsiveLayout> createState() => _responsiveLayoutState();
}

class _responsiveLayoutState extends State<responsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth>600){
        return widget.webScreenLayout;
      }else{
        return widget.mobileScreenLayout;
      }
    });
  }
}
