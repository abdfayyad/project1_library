class cobject {
  final String name ;
  bool isdone ;
  cobject({required this.name,this.isdone=false});
  void donechange(){
    isdone=!isdone;

  }
}