import 'package:http/http.dart' as http;
import 'package:project4/helper/Constants.dart';
import 'dart:convert';
import 'package:project4/models/QuoteModel.dart';

class QuoteRepository{

    Future<List<QuoteModel>> getQuotesByTag(String tag) async{

    final result = await http.Client().get(Uri.parse(baseUrlGetQuoteByTag +"$tag"),headers:<String,String>{'authorization':basicAuth});
    print("qutebyTAG repo: " + result.body);

    if(result.statusCode != 200)
      throw Exception();
    return parsedJsonQuoteByTag(result.body);

  }

  Future<List<QuoteModel>> getQuotes() async{
    print('on the getQuote method');
    final result = await http.Client().get(Uri.parse(baseUrl),headers:<String,String>{'authorization':basicAuth});
    print('printing get request result : ' + result.body.toString());

    if(result.statusCode != 200) {
      print("Exception thrown: " + result.statusCode.toString());
      throw Exception();
    }
    print("SUCCESS: gets here:" + result.statusCode.toString());
//    print("inside parsedJson : " + json.decode(result.body));
    return parsedJson(result.body);

  }


//    Future<List<QuoteModel>> getDetailQuote(String position) async{
//      final result = await http.Client().get(Uri.parse(baseUrlGetQuoteDetail),headers:<String,String>{'authorization':basicAuth});
//
//      if(result.statusCode != 200)
//        throw Exception();
//      return parsedJson(result.body);
//    }




  List<QuoteModel> parsedJson(final response){
    print("inside parsedJson : " );
    Map<String, dynamic> quoteMap  = jsonDecode(response)['datas'];

    print("JSONDECODED : " +  quoteMap.toString());
//    print("quote: " +  QuoteModel.fromJson(quoteMap[0]).toString());
    List<QuoteModel> quotes = <QuoteModel>[];
    for (var data in quoteMap["data"]){
      quotes.add(QuoteModel.fromJson(data));
    }
    return quotes;
//    final jsonQuote = jsonDecoded["datas"];
//    print("parsedJson : " + jsonQuote);

//    return QuoteModel.fromJson(jsonQuote);
  }

  List<QuoteModel> parsedJsonQuoteByTag(final response){
    print("inside parsedJsonQuoteByTag : " );
    Map<String, dynamic> quoteMap  = jsonDecode(response)['teen_quotes'];

    print("JSONDECODED_QuoteByTag : " +  quoteMap.toString());
    List<QuoteModel> quotes = <QuoteModel>[];
    for (var data in quoteMap["data"]){
      quotes.add(QuoteModel.fromJson(data));
    }
    return quotes;
  }
}