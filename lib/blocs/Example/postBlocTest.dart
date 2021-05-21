import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:project4/blocs/Example/postEvent.dart';
import 'package:project4/blocs/Example/postState.dart';
import 'package:project4/helper/Constants.dart';
import 'package:project4/models/QuoteModel.dart';




class PostBloc extends Bloc<PostEvent, PostState> {
  var quoteLength = 20;
  final http.Client httpClient;

  PostBloc({@required this.httpClient}) : super(null);



//  @override
//  Stream<PostState> transform(
//    Stream<PostEvent> events,
//    Stream<PostState> Function(PostEvent event) next,
//  ) {
//    return super.transform(
//      (events as Observable<PostEvent>).debounceTime(
//        Duration(milliseconds: 500),
//      ),
//      next,
//    );
//  }

//  @override
//  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is Fetch && !_hasReachedMax(state)) {
      try {
        if (state is PostUninitialized) {
          final posts = await getQuotes(1,quoteLength);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (state is PostLoaded) {
          final posts =  await getQuotes((state as PostLoaded).posts.length, quoteLength);
          yield posts.isEmpty
              ? (state as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: (state as PostLoaded).posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

//  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
//    final response = await httpClient
//        .get(Uri.parse(exampleUrl + '$startIndex&_limit=$limit'));
//    if (response.statusCode == 200) {
//      final data = json.decode(response.body) as List;
//      return data.map((rawPost) {
//        return Post(
//          id: rawPost['id'],
//          title: rawPost['title'],
//          body: rawPost['body'],
//        );
//      }).toList();
//    } else {
//      throw Exception('error fetching posts');
//    }
//  }

  Future<List<QuoteModel>> getQuotes(int startIndex, int limit) async{
    print('on the getQuote method');
    final result = await http.Client().get(Uri.parse("https://datascienceplc.com/apps/manager/api/items/blog/post?page=$startIndex&app_id=7&rand=9985"),headers:<String,String>{'authorization':basicAuth});
    print('printing get request result : ' + result.body.toString());

    if(result.statusCode != 200) {
      print("Exception thrown: " + result.statusCode.toString());
      throw Exception();
    }
    print("SUCCESS: gets here:" + result.statusCode.toString());
//    print("inside parsedJson : " + json.decode(result.body));
    return parsedJson(result.body);

  }


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
