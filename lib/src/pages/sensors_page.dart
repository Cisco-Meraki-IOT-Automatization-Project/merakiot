import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:merakiot/src/models/sensors_org_model.dart';
import 'package:merakiot/src/provider/agenda_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
class SensorPage extends StatefulWidget {
  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final sensorsProvider = SensorsProvider();

  IconData icon;

  MaterialColor color;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: size.height*0.5,
          child: FutureBuilder(
            future: sensorsProvider.getSensors(),
            builder: (BuildContext context, AsyncSnapshot<List<SensorOrg>> snapshot) {
              if(snapshot.hasData){
                return Swiper(

                  itemCount: snapshot.data.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: size.width*0.6,
                  itemHeight: size.height*0.9,
                  itemBuilder: (_, int index){
                      var title =snapshot.data[index].idSensor;
                      if(snapshot.data[index].door != null){
                        if(snapshot.data[index].door.last.sensorValue=='0'){
                          color = Colors.red;
                          icon = FontAwesomeIcons.doorClosed;
                        }else{
                          color = Colors.green;
                          icon = FontAwesomeIcons.doorOpen;
                        }
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(snapshot.data[index].idSensor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  FaIcon(icon,color: color,),
                                  Text(readTimestamp(int.parse(snapshot.data[index].door.last.ts)))

                                ],
                              )
                            ],
                          ),
                        );
                      }else{
                        final List<_ChartData> chartData = <_ChartData>[
                          _ChartData('Temperature', double.parse(double.parse(snapshot.data[index].temperature.last.sensorValue).toStringAsFixed(2)), const Color.fromRGBO(235, 97, 143, 1)),
                          _ChartData('Humidity', double.parse(snapshot.data[index].humidity.last.sensorValue), const Color.fromRGBO(69, 187, 161, 1)),
                        ];
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: SfCircularChart(
                            title: ChartTitle(text: title,),
                            series: <CircularSeries>[
                              RadialBarSeries<_ChartData, String>(
                                maximumValue: 96,
                                  radius: '100%',
                                  gap: '3%',
                                  dataSource: chartData,
                                  xValueMapper: (_ChartData data, _)=> data.x,
                                  yValueMapper: (_ChartData data, _)=> data.y,
                                pointColorMapper: (_ChartData data, _)=> data.color,
                                  cornerStyle: CornerStyle.bothCurve,
                                dataLabelSettings: DataLabelSettings(isVisible: true),
                                enableTooltip: true
                              )
                            ],
                          ),
                        );
                      }
                    });
    }
              else{
                    return Container( height: 400,child: Center(child: CircularProgressIndicator(),),);
                  }

                },

          ),
        ),
      ),
    );
  }
}
String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {

      time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
    }
  }

  return time;
}

class _ChartData {
  _ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}