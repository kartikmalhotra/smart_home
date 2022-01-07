import 'package:flutter/material.dart';
import 'package:pixel/screens/audio_card.dart';
import 'package:pixel/screens/plug_card.dart';
import 'package:pixel/screens/temp_card.dart';
import 'package:pixel/screens/tv_card.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          opacity: 0.9,
          image: NetworkImage(
              "https://media.istockphoto.com/photos/rustic-home-interior-mockup-with-benchchairs-and-decor-in-red-room-picture-id1159114337?b=1&k=20&m=1159114337&s=170667a&w=0&h=7fTyJpZw5cSSGvyk-ifAjG3RE83WzPZROcIMw3L6wPQ="),
        ),
      ),
      child: _showContents(context),
    );
  }

  Widget _showContents(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            _showHeader(context),
            const SizedBox(height: 60.0),
            _showLivigRoomText(context),
            const SizedBox(height: 20.0),
            _showTemperaturePlugCards(context),
            const SizedBox(height: 10.0),
            _showMusicTVCards(context),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _showStatisticsMonth(context),
        ),
      ],
    );
  }

  Widget _showHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Good Morning",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Chris Cooper",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(15.0),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _showLivigRoomText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Living Room ",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _showTemperaturePlugCards(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: TempReadCard(),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: PlugWallCard(),
        ),
      ],
    );
  }

  Widget _showMusicTVCards(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: AudioPlayerCard(),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: TVCard(),
        ),
      ],
    );
  }

  Widget _showStatisticsMonth(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Statictics",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Month",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white38, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.all(20.0),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          width: double.maxFinite,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Electricity Usage",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
