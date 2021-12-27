import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key key,
    this.title,
    this.contentList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: previews.length,
              itemBuilder: (context, index) {
                final Content contentIndex = previews[index];

                return GestureDetector(
                  onTap: () => print('previews'),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              contentIndex.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: contentIndex.color,
                            width: 4,
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [
                              0,
                              0.25,
                              1,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: contentIndex.color,
                            width: 4,
                          ),
                        ),
                      ),
                      Positioned(
                        child: SizedBox(
                          height: 60,
                          child: Image.asset(
                            contentIndex.titleImageUrl,
                          ),
                        ),
                        left: 0,
                        right: 0,
                        bottom: 0,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
