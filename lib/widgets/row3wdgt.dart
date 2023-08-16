import 'package:dashboard/screens/dataa.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Row3Wdgt extends StatefulWidget {
  const Row3Wdgt({super.key});

  @override
  State<Row3Wdgt> createState() => _Row3WdgtState();
}

class _Row3WdgtState extends State<Row3Wdgt> {
  double myChartmeter = 70;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //row1
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //col1
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //row1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => const DataA());
                            Navigator.push(context, route);
                          },
                          child: Container(
                            width: 52,
                            height: 52,
                            color: Colors.amber,
                            child: Image.asset('assets/images/kereta.png'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Kereta'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    //row2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          color: Colors.amber,
                          child: Image.asset('assets/images/lorry.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Lori'),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //row3
                    Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          color: Colors.amber,
                          child: Image.asset('assets/images/ship.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Kapal'),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                //col2
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 193,
                      height: 214,
                      // color: const Color.fromARGB(255, 244, 153, 24),
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 50,
                                  color: Colors.green),
                              GaugeRange(
                                  startValue: 50,
                                  endValue: 100,
                                  color: Colors.orange),
                              GaugeRange(
                                  startValue: 100,
                                  endValue: 150,
                                  color: Colors.red)
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(value: myChartmeter)
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Container(
                                      child: Text('$myChartmeter',
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold))),
                                  angle: 90,
                                  positionFactor: 0.5)
                            ])
                      ]),
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
