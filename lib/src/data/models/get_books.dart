import 'package:dio/dio.dart';

class GetBooksModel {
  List<Book>? listBooks;

  GetBooksModel({this.listBooks});

  GetBooksModel.fromJson(Map<String, dynamic>  json) {
    if (json['books'] != null) {
      listBooks = <Book>[];
      json['books'].forEach((v) {
        listBooks!.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listBooks != null) {
      data['books'] = this.listBooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  int? id;
  int? isbn;
  String? title;
  String? summery;
  String? coverPic;
  int? price;
  int? pagesCount;
  int? numOfParts;
  int? numOfCopies;
  int? views;
  int? categoryId;
  int? authorId;
  String? createdAt;
  String? updatedAt;
  Category? category;
  Author? author;

  Book(
      {this.id,
        this.isbn,
        this.title,
        this.summery,
        this.coverPic,
        this.price,
        this.pagesCount,
        this.numOfParts,
        this.numOfCopies,
        this.views,
        this.categoryId,
        this.authorId,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.author});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isbn = json['isbn'];
    title = json['title'];
    summery = json['summery'];
    coverPic = json['cover_pic'];
    price = json['price'];
    pagesCount = json['pages_count'];
    numOfParts = json['num_of_parts'];
    numOfCopies = json['num_of_copies'];
    views = json['views'];
    categoryId = json['category_id'];
    authorId = json['author_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isbn'] = this.isbn;
    data['title'] = this.title;
    data['summery'] = this.summery;
    data['cover_pic'] = this.coverPic;
    data['price'] = this.price;
    data['pages_count'] = this.pagesCount;
    data['num_of_parts'] = this.numOfParts;
    data['num_of_copies'] = this.numOfCopies;
    data['views'] = this.views;
    data['category_id'] = this.categoryId;
    data['author_id'] = this.authorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Author {
  int? id;
  String? fullName;
  String? createdAt;
  String? updatedAt;

  Author({this.id, this.fullName, this.createdAt, this.updatedAt});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}