
import 'package:flutter/material.dart';
import 'package:rest_api/model/model.dart';

class Textview extends StatefulWidget{

  final Root root ;
  Textview(this.root);

  @override
  State<StatefulWidget> createState() => new _Textview();
}
class _Textview extends State<Textview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text('اخبار اليوم '), backgroundColor: Colors.green[600],),

        body: Container(
    child: ListView.builder(
    itemBuilder: _buildText,
    itemCount: widget.root.text.length,
    ),

    )
    );
  }
  Widget _buildText(BuildContext context, int index) {

    return Card(
      child: Column(

        children: <Widget>[

         Text(widget.root.text),

        ],
      ),
    );
  }

}