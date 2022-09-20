class AddBookModel {
  String? isbn;
  String? title;
  String? summery;
  String? price;
  String? coverPic;
  String? pagesCount;
  String? numOfParts;
  String? numOfCopies;
  String? categoryId;
  String? authorId;
  String? updatedAt;
  String? createdAt;

  AddBookModel(
      {this.isbn,
        this.title,
        this.summery,
        this.price,
        this.coverPic,
        this.pagesCount,
        this.numOfParts,
        this.numOfCopies,
        this.categoryId,
        this.authorId,
        this.updatedAt,
        this.createdAt,
       });

  AddBookModel.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    title = json['title'];
    summery = json['summery'];
    price = json['price'];
    coverPic = json['cover_pic'];
    pagesCount = json['pages_count'];
    numOfParts = json['num_of_parts'];
    numOfCopies = json['num_of_copies'];
    categoryId = json['category_id'];
    authorId = json['author_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['title'] = this.title;
    data['summery'] = this.summery;
    data['price'] = this.price;
    data['cover_pic'] = this.coverPic;
    data['pages_count'] = this.pagesCount;
    data['num_of_parts'] = this.numOfParts;
    data['num_of_copies'] = this.numOfCopies;
    data['category_id'] = this.categoryId;
    data['author_id'] = this.authorId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}