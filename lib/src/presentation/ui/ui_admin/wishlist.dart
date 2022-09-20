import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

import 'details_books.dart';
double _rating=5;
class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context,i){
        return Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 8.0),
          child:   InkWell(
            onTap: (){
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (ctx) => Details(
              //         )));
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/image/ibb.jpg')),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    height: 100,
                    width: 80,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title:Al Lamobalah ',
                          maxLines: 2, overflow: TextOverflow.ellipsis,

                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 7.0,),
                        Text('Publisher:Nezar Kabane',
                          style: Theme.of(context).textTheme.bodyText2,),
                        const SizedBox(height: 5.0,),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: _rating,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '$_rating',
                              style:const TextStyle(
                                  fontSize: 19.0, color: Colors.amber),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  LikeButton(
                    //likeCount: 500,
                    countBuilder:
                        (int? count, bool isLiked, String text) {
                      var color =
                      isLiked ? Colors.black : Colors.black54;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          "love",
                          style: TextStyle(color: color),
                        );
                      } else
                        result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        isLiked
                            ? Icons.bookmark_outlined
                            : Icons.bookmark_outline_rounded ,
                        color: isLiked ? Colors.red : Colors.black,
                      );
                    },
                    padding:const EdgeInsets.all(5),
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
