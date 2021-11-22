import 'package:flutter/material.dart';

import 'package:home_rpi/models/measurement.dart';

class MeasurementItem extends StatelessWidget {
  const MeasurementItem(this.measurement, {Key? key}) : super(key: key);

  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          children: [
            Column(
              children: [
                const Icon(
                  Icons.timelapse,
                  size: 24,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text('H',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(measurement.getTimeHours())
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        const Text('M',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(measurement.getTimeMinutes())
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        const Text('S',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(measurement.getTimeSeconds())
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 32.0,
            ),
            Text(measurement.getMeasurementData(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ],
        ));
  }
}
