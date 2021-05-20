//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:meta/meta.dart';
//import 'package:http/http.dart' as http;
//import 'package:project4/blocs/Example/quoteEvent.dart';
//import 'package:project4/blocs/Example/quoteState.dart';
//import 'package:project4/helper/Constants.dart';
//import 'package:project4/models/QuoteModel.dart';
//import 'package:project4/repository/quoteRepository.dart';
//
//class QuoteBlocTest extends Bloc<QuoteEvent, QuoteState> {
//  final QuoteRepository quoteRepository;
//
//  QuoteBlocTest(this.quoteRepository) : super(QuoteUninitialized());
//
//
//
//  @override
//  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
//    if (event is FetchQuote && !_hasReachedMax(currentState)) {
//      try {
//        if (currentState is PostUninitialized) {
//          final posts = await quoteRepository.getQuotes(0, 20);
//          yield PostLoaded(posts: posts, hasReachedMax: false);
//        }
//        if (currentState is PostLoaded) {
//          final posts = await _fetchPosts(currentState.posts.length, 20);
//          yield posts.isEmpty
//              ? currentState.copyWith(hasReachedMax: true)
//              : PostLoaded(
//              posts: currentState.posts + posts, hasReachedMax: false);
//        }
//      } catch (_) {
//        yield PostError();
//      }
//    }
//  }
//
//
//  bool _hasReachedMax(QuoteState state) => state is QuoteIsLoaded && state.hasReachedMax;
//
////  Future<List<QuoteModel>> _fetchPosts(int startIndex, int limit) async {
////    final response = await http.Client().get('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
////    if (response.statusCode == 200) {
////      final data = json.decode(response.body) as List;
////      return data.map((rawPost) {
////        return Post(
////          id: rawPost['id'],
////          title: rawPost['title'],
////          body: rawPost['body'],
////        );
////      }).toList();
////    } else {
////      throw Exception('error fetching posts');
////    }
////  }
//
//  Future<List<QuoteModel>> getQuotes(int startIndex, int limit) async{
//    print('on the getQuote method');
//    final result = await http.Client().get(Uri.parse(baseUrl),headers:<String,String>{'authorization':basicAuth});
//    print('printing get request result : ' + result.body.toString());
//
//    if(result.statusCode != 200) {
//      print("Exception thrown: " + result.statusCode.toString());
//      throw Exception();
//    }
//    print("SUCCESS: gets here:" + result.statusCode.toString());
////    print("inside parsedJson : " + json.decode(result.body));
//    return parsedJson(result.body);
//
//  }
//
//
//
//
//}