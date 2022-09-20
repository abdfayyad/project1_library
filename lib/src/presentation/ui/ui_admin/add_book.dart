import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_addbooke/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_addbooke/states.dart';
import 'package:flutter_app1111/src/presentation/ui/home_page.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_app1111/src/presentation/widgets/componentes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/datasources/end_points.dart';
import '../../../data/models/get_books.dart';

var selectedCategory1 = 'Religious';
List<String> category = [
  'Religious',
  'Romantic',
  'Cultural',
  'Scientific',
  'Historical',
  'Other',
];
Map<String, int> authors = {
  'nezar kabane': 1,
  'kassem': 2,
  'weleam': 3,
  'franz': 4,
  'ahlam': 5,
  'Altiyb saleh': 6,
  'waseny': 7,
  'abdalfatah emam': 8,
  'gamal': 9,
  'mostafa': 10,
  'ahmad shoky': 11,
};
double value = 3.5;

class AddBooks extends StatefulWidget {
  late Book? book;
  bool? isUpdate;

  AddBooks({this.book, this.isUpdate});

  @override
  State<AddBooks> createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  TextEditingController titleController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController isbnController = TextEditingController();

  TextEditingController pageNumberController = TextEditingController();

  // TextEditingController languageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController seriesController = TextEditingController();

  // TextEditingController volController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController summaryController = TextEditingController();

  String? imageEdit;
  late AddBookCubit addBookCubit;
  File? image;

  Future getImage(ImageSource src) async {
    final pickerFile = await ImagePicker().getImage(source: src);
    setState(() {
      if (pickerFile != null) {
        image = File(pickerFile.path);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addBookCubit = AddBookCubit(dioHelper: DioHelper());

    if (widget.isUpdate == true) {
      titleController.text = widget.book!.title!;
      isbnController.text = "${widget.book!.isbn!}";
      publisherController.text = "${widget.book!.author!.fullName}";
      pageNumberController.text = "${widget.book!.pagesCount!}";
      priceController.text = "${widget.book!.price!}";
      quantityController.text = "${widget.book!.numOfCopies!}";
      seriesController.text = "${widget.book!.numOfParts!}";
      summaryController.text = "${widget.book!.summery!}";
      imageEdit = widget.book!.coverPic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => addBookCubit,
      child: BlocConsumer<AddBookCubit, AddBookState>(
        listener: (context, state) {
          if (state is AddBookSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (ctx) => HomePage()));
          }
          if (state is AddBookErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          AddBookCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.isUpdate == true ? 'Edit' : 'Add',
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      print(isbnController.text);
                      print(titleController.text);
                      print( summaryController.text);
                      print(priceController.text);
                      print(pageNumberController.text);
                      print(seriesController.text);
                      print(quantityController.text);
                      print((category.indexOf(selectedCategory1) + 1)
                          .toString());
                      print(authors[
                      '${publisherController.text.toString()}']
                          .toString());

                      widget.isUpdate == true
                          ? cubit.updateBook(
                              idBookUpdate: widget.book!.id!,
                              isbn: isbnController.text,
                              title: titleController.text,
                              summery: summaryController.text,
                              price: priceController.text,
                              pagesCount:  pageNumberController.text,
                              numOfParts: seriesController.text,
                              numOfCopies: quantityController.text,
                              categoryId: (category.indexOf(selectedCategory1) + 1)
                                  .toString(),
                              authorId: authors[
                              '${publisherController.text.toString()}']
                                  .toString(),
                              coverPic: image)
                          : cubit.addBook(
                              isbn: isbnController.text,
                              title: titleController.text,
                              summery: summaryController.text,
                              price: priceController.text,
                              pagesCount: pageNumberController.text,
                              numOfParts: seriesController.text,
                              numOfCopies: quantityController.text,
                              categoryId:
                                  (category.indexOf(selectedCategory1) + 1)
                                      .toString(),
                              authorId: authors[
                                      '${publisherController.text.toString()}']
                                  .toString(),
                              coverPic: image,
                            );
                    },
                    icon: Icon(Icons.save))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(hintText: 'Title'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              width: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                color: Colors.white,
                              ),
                              child: imageEdit != null && image==null
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "$baseUrlImage$imageEdit"))),
                                    )
                                  : image == null
                                      ? Icon(
                                          Icons.book,
                                          size: 50.0,
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.teal,
                                              image: DecorationImage(
                                                  image: FileImage(image!))),
                                        ),
                            ),
                            Positioned(
                              left: 60,
                              top: 120,
                              child: IconButton(
                                icon: Icon(Icons.add_a_photo),
                                color: Colors.grey.shade700,
                                iconSize: 30,
                                onPressed: () {
                                  var ad = AlertDialog(
                                    title: Text("chose photo from :"),
                                    content: Container(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Divider(
                                            height: 10,
                                          ),
                                          Container(
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: ListTile(
                                              leading: Icon(Icons.photo),
                                              title: Text("Gallery"),
                                              onTap: () {
                                                getImage(ImageSource.gallery);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: ListTile(
                                              leading: Icon(Icons.add_a_photo),
                                              title: Text("Camera"),
                                              onTap: () {
                                                getImage(ImageSource.camera);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  showDialog(
                                      context: context, builder: (_) => ad);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: publisherController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.print_outlined),
                                    hintText: 'publisher ',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: isbnController,
                                  decoration: const InputDecoration(
                                    icon: ImageIcon(
                                        AssetImage('assets/image/barcode.png')),
                                    hintText: 'ISNB 987xxxxxxxxxx',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Category:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedCategory1,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: category.map((String category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory1 = newValue!;
                                });
                              }),
                        ),
                      ],
                    ),
                    Container(
                      height: 210,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Page Number:',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: pageNumberController,
                                  decoration: InputDecoration(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Price:',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: priceController,
                                  decoration: InputDecoration(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Series:',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: seriesController,
                                  decoration: InputDecoration(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Quantity:',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: quantityController,
                                  decoration: InputDecoration(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          height: 35,
                          width: 30,
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: ImageIcon(
                                  AssetImage("assets/image/summary.png"))),
                        ),
                        SizedBox(
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

                      child: ConstrainedBox(
                        //  fit: FlexFit.loose,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          //when it reach the max it will use scroll
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: TextField(
                          controller: summaryController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 5,
                          decoration: const InputDecoration(
                            // fillColor: Colors.white,
                            filled: true,
                            hintText: "Summary of this book  ",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
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
