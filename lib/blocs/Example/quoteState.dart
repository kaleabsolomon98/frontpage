import 'package:equatable/equatable.dart';
import 'package:project4/models/QuoteModel.dart';


class QuoteState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class QuoteUninitialized extends QuoteState{
  @override
  String toString() => 'QuoteUninitialized';
}

class QuoteIsLoaded extends QuoteState{
  final List<QuoteModel> quotes;
  final bool hasReachedMax;

  QuoteIsLoaded({this.quotes, this.hasReachedMax});

  QuoteIsLoaded copyWith({
    List<QuoteModel> quotes,
    bool hasReachedMax,
  }) {
    return QuoteIsLoaded(
      quotes: quotes ?? this.quotes,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'PostLoaded { posts: ${quotes.length}, hasReachedMax: $hasReachedMax }';


  List<QuoteModel> get getQuotes => quotes;

  @override
  // TODO: implement props
  List<Object> get props => [quotes];
}



class QuoteIsNotLoaded extends QuoteState{
  @override
  String toString() => 'QuoteIsNotLoaded:Error';
}

