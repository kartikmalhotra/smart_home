import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioPlayerCard extends StatefulWidget {
  const AudioPlayerCard({Key? key}) : super(key: key);

  @override
  _AudioPlayerCardState createState() => _AudioPlayerCardState();
}

class _AudioPlayerCardState extends State<AudioPlayerCard> {
  final List<Audio> audios = <Audio>[
    Audio(
      'assets/audio/song2.mp3',
      //playSpeed: 2.0,
      metas: Metas(
        id: 'Rock',
        title: 'Rock',
        artist: 'Florent Champigny',
        album: 'RockAlbum',
        image: const MetasImage.network(
            'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png'),
      ),
    ),
    Audio(
      'assets/audio/song3.mp3',
      metas: Metas(
        id: 'Country',
        title: 'Country',
        artist: 'Florent Champigny',
        album: 'CountryAlbum',
        image: const MetasImage.network(
            'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png'),
      ),
    ),
  ];
  bool _play = true;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    openPlayer();
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: false,
      autoStart: false,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AudioWidget.assets(
            path: audios[_currentIndex].path,
            play: _play,
            onReadyToPlay: (duration) {},
            onPositionChanged: (current, duration) {},
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        opacity: 0.9,
                        image: NetworkImage(
                            audios[_currentIndex].metas.image!.path.toString()),
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        audios[_currentIndex].metas.title.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        audios[_currentIndex].metas.artist.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0.0),
                constraints: const BoxConstraints(),
                onPressed: () {
                  _currentIndex = (_currentIndex - 1) % audios.length;
                  setState(() => {});
                },
                icon: const Icon(Icons.skip_previous, color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  setState(() => _play = !_play);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0.0),
                constraints: const BoxConstraints(),
                onPressed: () {
                  _currentIndex = (_currentIndex + 1) % audios.length;
                  setState(() => {});
                },
                icon: const Icon(Icons.skip_next, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
