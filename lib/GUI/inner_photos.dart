
import 'package:flutter/material.dart';
import 'package:rest_api/model/model.dart';



class Innerphotos extends StatefulWidget{

  final Root root ;
  Innerphotos(this.root);

  @override
  State<StatefulWidget> createState() => new _InnerphotosState();

}

class _InnerphotosState extends State<Innerphotos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text('الصور'), backgroundColor: Colors.green[600],),
      body:
      Container(
        child: ListView.builder(
        itemBuilder: _buildPhotos,
        itemCount: widget.root.inner_photos.length,
      ),
      ),
    );
  }

  Widget _buildPhotos(BuildContext context, int index) {

    return Card(
      child: Column(
        children: <Widget>[
          Image.network(widget.root.inner_photos[index]),

        ],
      ),
    );
  }


}