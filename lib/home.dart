


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lrc/lrc.dart';

class Home extends StatefulWidget{


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> lyrList=[];

  final ScrollController _scrollController = ScrollController();

  var song = """
[ti:Never Gonna Give You Up]
[ar:Rick Astley]
[la:en]
[00:18.78]We're no strangers to love
[00:22.83]You know the rules and so do I
[00:27.11]A full commitment's what I'm thinking of
[00:31.25]You wouldn't get this from any other guy
[00:34.78]We're no strangers to love
[00:36.83]You know the rules and so do I
[00:37.11]A full commitment's what I'm thinking of
[00:41.25]You wouldn't get this from any other guy
[00:46.78]We're no strangers to love
[00:52.83]You know the rules and so do I
[00:57.11]A full commitment's what I'm thinking of
[01:01.25]You wouldn't get this from any other guy
[01:04.78]We're no strangers to love
[01:06.83]You know the rules and so do I
[01:07.11]A full commitment's what I'm thinking of
[01:11.25]You wouldn't get this from any other guy
[01:18.78]We're no strangers to love
[01:22.83]You know the rules and so do I
[01:27.11]A full commitment's what I'm thinking of
[01:31.25]You wouldn't get this from any other guy
[01:34.78]We're no strangers to love
[01:36.83]You know the rules and so do I
[01:37.11]A full commitment's what I'm thinking of
[01:41.25]You wouldn't get this from any other guy
[01:46.78]We're no strangers to love
[01:52.83]You know the rules and so do I
[01:57.11]A full commitment's what I'm thinking of
[02:01.25]You wouldn't get this from any other guy
[02:04.78]We're no strangers to love
[02:06.83]You know the rules and so do I
[02:07.11]A full commitment's what I'm thinking of
[02:11.25]You wouldn't get this from any other guy
""";

  ///Parse LRC
  //var lrc = Lrc.parse(song);


  //final ScrollController _scrollController = ScrollController();






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printLyrics();


    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollToLastItem();
    // });



  }







  void printLyrics() async {

    var lrc=Lrc.parse(song);
    await for (LrcStream i in lrc.stream) {

      setState(() {

        lyrList.add('${i.current.lyrics}');




      });


      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });

      //print('++++++++++++++++++++++++++${i.current.lyrics}+++++++++++++++++++++++++++');



    }
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            for(int i=0;i<lyrList.length;i++)
        Text(lyrList[i],style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)



            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 16),
            //   child: ListView.builder(
            //     controller: scrollController,
            //       physics: BouncingScrollPhysics(),
            //       reverse: false,
            //
            //     // physics: ScrollPhysics(),
            //     shrinkWrap: true,
            //   itemCount: lyrList.length,
            //   itemBuilder: (context,index){
            //
            //
            //
            //
            //
            //       return Text(lyrList[index],style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),);
            //
            //   }),
            // )


            //    for (LrcStream i in lrc.stream.toList())
            // Text('++++++++++++++++++++++++++${i.current.lyrics}+++++++++++++++++++++++++++')


          ],
        ),
      ),
    );
  }



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



}