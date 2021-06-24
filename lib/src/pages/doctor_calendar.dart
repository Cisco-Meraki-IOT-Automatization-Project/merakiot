import 'package:flutter/material.dart';
import 'package:merakiot/src/models/agenda_model.dart';
import 'package:merakiot/src/provider/agenda_provider.dart';
import 'package:merakiot/src/utils/shared_preferences.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _MainScroll(),
            Positioned(
              child: _BotonNewItem(),
              bottom: -10,
              right: 0,
            ),

          ],
        )
    );
  }
}
class _BotonNewItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width *0.9,
      height: 100,
      child: RaisedButton(
        onPressed: (){
          print('hello');
        },
        child: Text('Borrar agenda',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 3),),
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
      ),
    );
  }
}

class _Titulo extends StatefulWidget {
  @override
  __TituloState createState() => __TituloState();
}

class __TituloState extends State<_Titulo> {
  final prefs = new PreferenciasUsuario();
  String _name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name= prefs.nombre;
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: Text('Agenda',style: TextStyle(color: Color(0xff532128),fontSize: 50),),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100,),
            Positioned(
              bottom:8,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(color: Color(0xffF7CDD5)),
              ),
            ),
            Container(
              child: Text(_name,style: TextStyle(color: Color(0xffD93A30),fontSize: 40,fontWeight: FontWeight.bold),),
            ),
          ],
        )
      ],
    );
  }
}

class _MainScroll extends StatefulWidget {


  @override
  __MainScrollState createState() => __MainScrollState();
}

class __MainScrollState extends State<_MainScroll> {
  final citasProvider = new AgendaProvider();
  final prefs = new PreferenciasUsuario();

  final items = [
    _ListItem(titulo: 'COVID',        color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Sin sintomas',        color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Consulta General', color: Color(0xffF7CDD5) ),
  ];

  @override
  Widget build(BuildContext context) {
  var citas = citasProvider.getDoctor(prefs.email);
    return FutureBuilder(
      future: citasProvider.getDoctor(prefs.email),
      builder: (BuildContext context, AsyncSnapshot<List<Cita>> snapshot){
        if(snapshot.hasData){
          return CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                floating: true,
                delegate: _SliderCustomHeaderDelegate(170,200,Container(alignment:Alignment.centerLeft,color: Colors.white,child: _Titulo())),

              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context , int inde){
                      print(snapshot.data[0].motive);
                      return _ListItem(
                        titulo: snapshot.data[inde].motive,
                          color: Color(0xffF08F66)
                      );
                    },
                  childCount: snapshot.data.length

                ),
              )
            ],
          );
        }
        else{
          return Container( height: 400,child: Center(child: CircularProgressIndicator(),),);
        }
      },
    );
  }
}
class _SliderCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliderCustomHeaderDelegate(
      @required this.minheight,
      @required this.maxheight,
      @required this.child);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override

  double get maxExtent => (minheight> maxheight)? minheight : maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxExtent || minheight != oldDelegate.minExtent;
  }
}
class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem({
    Key key, this.titulo, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(titulo,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}