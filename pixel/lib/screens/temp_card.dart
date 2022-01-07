import 'package:flutter/material.dart';

class TempReadCard extends StatelessWidget {
  const TempReadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Home Temperature",
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 20.0),
          Text(
            "23 .c",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(width: 10.0),
          Switch(
            value: true,
            onChanged: (value) {},
            activeColor: Colors.white,
            trackColor: MaterialStateProperty.all(Colors.orange[200]),
          ),
        ],
      ),
    );
  }
}
