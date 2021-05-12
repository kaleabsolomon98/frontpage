class QuoteModel {
  String id;
  String quote;
  String quote_writer;
  String tag;
  String like;
  String isEnabled;

  QuoteModel({this.id ,this.quote,this.quote_writer,this.tag,this.like,this.isEnabled});

  factory QuoteModel.fromJson(Map<String,dynamic> json){
    var a =  QuoteModel(
      id: json['id'],
      quote: json['quote'],
      quote_writer: json['quote_writer'],
      tag: json['tag'],
      like: json['like'],
      isEnabled: json['enable']
    );

    return a;
  }




}