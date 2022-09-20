

import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/end_points.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/details_books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/details_books_user.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:like_button/like_button.dart';
double _rating=5;
class BooksUser extends StatelessWidget {
  final List<Book>? books;

  const BooksUser({Key? key, this.books}) : super(key: key);

  Widget build(BuildContext context) {
    return  Scaffold(


      body:books==null?Center(child: const CircularProgressIndicator(),):books!.isEmpty?Center(child: Text('There are not books',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),):ListView.builder(
        itemCount: books!.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 8.0),
            child:   InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => DetailsUser(
                          book: books![index],
                        )));
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
                          image: DecorationImage(image: NetworkImage('$baseUrlImage${books![index].coverPic}')),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      height: 100,
                      width: 80,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title:${books![index].title}',
                            maxLines: 2, overflow: TextOverflow.ellipsis,

                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 7.0,),
                          Text('Publisher:${books![index].author!.fullName}',
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

      ),


    );
  }
}
