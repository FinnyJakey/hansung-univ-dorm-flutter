import 'package:flutter/material.dart';

Widget contactWidget(
  BuildContext context,
  String kind,
  String location,
  String operationTime,
  String number,
  String fax,
) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(left: 15.0, bottom: 10.0),
        width: 10,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.indigoAccent.shade100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.only(bottom: 10.0, right: 15.0),
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                kind,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text('위치  |  $location'),
              Text('운영시간  |  $operationTime'),
              Text('전화번호  |  $number'),
              Text('팩스번호  |  $fax'),
            ],
          ),
        ),
      ),
    ],
  );
}
