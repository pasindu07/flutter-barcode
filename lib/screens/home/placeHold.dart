import 'package:flutter/material.dart';



class PlaceholderWidget extends StatefulWidget {
 final Color color;

 PlaceholderWidget(this.color);

  @override
  _PlaceholderWidgetState createState() => _PlaceholderWidgetState();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget> {
 @override
 Widget build(BuildContext context) {
   return Container(
     color: widget.color,
   );
 }
}