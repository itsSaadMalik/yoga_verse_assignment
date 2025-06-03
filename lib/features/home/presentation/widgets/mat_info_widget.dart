import 'package:flutter/material.dart';
import 'package:yoga_verse/core/route_names.dart';

class MatInfoWidget extends StatelessWidget {
  const MatInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 300,
          width: 125,
          margin: EdgeInsets.only(left: 15),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Image(
            height: 300,
            // width: 150,
            image: AssetImage('assets/images/yoga_mat_main_1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.bodySmall ?? TextStyle(),
          child: Expanded(
            child: Column(
              spacing: 25,
              children: [
                Text(
                  'Experience a smarter way to practice yoga with our SmartMat.',
                  style: TextStyle(fontWeight: FontWeight.bold, wordSpacing: 1),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Designed to seamlessly connect with your mobile device, it tracks your posture, pressure points, and session progress in real time — helping you improve alignment and focus with every pose.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 11, height: 1.8),
                  strutStyle: StrutStyle(),
                  softWrap: true,
                  textAlign: TextAlign.left,
                ),
                InkWell(
                  splashColor: Colors.white.withValues(alpha: .3),
                  onTap: () => Navigator.pushNamed(context, RouteNames.about),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('learn more', style: TextStyle(fontSize: 10)),
                      Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
