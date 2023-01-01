import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';

class TabVarViewContents extends StatefulWidget {
  final List<Song> song;
  const TabVarViewContents({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  State<TabVarViewContents> createState() => _TabVarViewContentsState();
}

class _TabVarViewContentsState extends State<TabVarViewContents> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.song.isEmpty ? 0 : widget.song.length,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ]),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  NetworkImage(widget.song[index].coverUrl))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.song[index].title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.song[index].author,
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Avenir",
                              color: Colors.grey),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.blueAccent.withOpacity(0.2),
                          ),
                          child: Text(widget.song[index].category,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Avenir",
                                  color: Colors.white)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
