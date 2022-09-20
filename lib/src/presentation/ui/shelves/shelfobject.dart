class shelfobject {
  final String name ;
  bool isdone ;
  shelfobject({required this.name,this.isdone=false});
  void donechange(){
    isdone=!isdone;

  }
}