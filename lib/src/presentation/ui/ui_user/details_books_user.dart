import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1111/src/data/datasources/end_points.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/add_book.dart';
import 'package:flutter_app1111/src/presentation/widgets/summary.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

double _rating = 3.5;
final String description =
    "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. have a question , how can I put the show more behind the text , I mean it looks like this Flutter is Google’s mobile UI framework for... show more,they are both in the same line Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. have a question , how can I put the show more behind the text , I mean it looks like this Flutter is Google’s mobile UI framework for... show more,they are both in the same line";

class DetailsUser extends StatelessWidget {
  final Book book;
  const DetailsUser({Key? key,required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        // actions: [
        //   IconButton(onPressed: () {
        //
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBooks(book:book,isUpdate: true,)));
        //
        //   }, icon: const Icon(Icons.edit)),
        //   IconButton(onPressed: () {
        //     AwesomeDialog(
        //       context: context,
        //       animType: AnimType.SCALE,
        //       dialogType: DialogType.QUESTION,
        //       title: 'Delete',
        //       desc: 'Do you want to delete this book?',
        //       btnOkOnPress: () {
        //
        //
        //         Navigator.of(context).pop();
        //       },
        //     ).show();
        //
        //   }, icon: const Icon(Icons.delete))
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Title:${book.title!}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const  SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    //photo and some details
                    Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              image: DecorationImage(
                                  image: NetworkImage('$baseUrlImage${book.coverPic}'))),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [

                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 30,
                                      child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: ImageIcon(AssetImage(
                                              "assets/image/publisher.png"))),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      book.author!.fullName!,
                                      style: TextStyle(fontSize: 19.0),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 30,
                                      child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: ImageIcon(AssetImage(
                                              "assets/image/barcode.png"))),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '${book.isbn}',
                                      style: TextStyle(fontSize: 19.0),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: _rating,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 35.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '$_rating',
                                      style: TextStyle(
                                          fontSize: 19.0, color: Colors.amber),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //like bottom and comment
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LikeButton(
                              likeCount: 500,

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
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: isLiked ? Colors.red : Colors.black,
                                );
                              },
                              padding: EdgeInsets.all(5),
                            ),
                            VerticalDivider(
                              width: 3,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.comment))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                Container(
                  height: 35,
                  width: 30,
                  child:const FittedBox(
                      fit: BoxFit.cover,
                      child: ImageIcon(AssetImage("assets/image/summary.png"))),
                ),
                const  SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'Summary',
                  style: TextStyle(fontSize: 19.0),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, top: 0.0, right: 10.0, bottom: 0.0),
              // padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: new BorderRadius.circular(10.0)),

              child: new DescriptionTextWidget(text: book.summery!),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Publish Date:',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          book.createdAt!.substring(0,10),
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Page number:',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          '${book.pagesCount}',
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price:',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          children: [
                            Text(
                              '${book.price}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              '\$',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Series:',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          '${book.numOfParts}',
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          '${book.numOfCopies}',
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
