import 'package:equatable/equatable.dart';
import 'package:project4/models/QuoteModel.dart';


class QuoteState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class QuoteIsLoading extends QuoteState{
}

class QuoteIsLoaded extends QuoteState{
  final List<QuoteModel> _quotes;

  QuoteIsLoaded(this._quotes);
  List<QuoteModel> get getQuotes => _quotes;

  @override
  // TODO: implement props
  List<Object> get props => [_quotes];
}

class QuoteDetailLoaded extends QuoteState{
  final QuoteModel _quote;
  QuoteDetailLoaded(this._quote);

  QuoteModel get getQuoteDetail => _quote;

  @override
  // TODO: implement props
  List<Object> get props => [_quote];
}


class QuoteIsNotLoaded extends QuoteState{}

class QuoteStateRefreshing extends QuoteState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

