import 'package:alnawawiforty/utils/colors.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../model/hadithe.dart';

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;
  LocalAudio({this.localAudioPath, this.hadith});

  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();

  static final AudioPlayer  advancedPlayer = new AudioPlayer();
  final AudioCache  audioCache = new AudioCache(fixedPlayer: advancedPlayer);

  @override
  void initState() {
    super.initState();
    initPlayer();
  }
  @override

  void initPlayer() {
    advancedPlayer.durationHandler = (d) => setState(() {
      onError: (Exception exception) =>
          print('_loadFile => exception $exception');
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(Icons.add_shopping_cart,color:Colors.cyan,size: 250),

        slider(),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  //// test
  VoidCallback onPressedplypus(){
    bool bol=true;
    if(bol){
      audioCache.play("path");
      _btn(Icon(Icons.play_arrow), () => advancedPlayer.pause());
    }else{
      bol=false;
      advancedPlayer.pause();
      _btn(Icon(Icons.pause), () => advancedPlayer.pause());
    }

  }
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 50.0,
      child: Container(
        width: 70,
        height: 50,
        child: RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            child: icon,
            color: Colors.grey[200],
            textColor: colorApp.primary,
            onPressed: onPressed),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: colorApp.primary,
        inactiveColor: Colors.black45,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget LocalAudio( String path) {

    return _tab([
      _btn(Icon(Icons.play_arrow), () => audioCache.play(path)),
      _btn(Icon(Icons.pause), () => advancedPlayer.pause()),
      _btn(Icon(Icons.stop), () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Container(

      decoration: BoxDecoration(
        // assets/ryan.jpg
        image: DecorationImage(image: AssetImage("assets/aa.jpg"), fit: BoxFit.cover),
      ),
      child:    LocalAudio(widget.localAudioPath),


    ),) ;
  }

}