import 'package:equatable/equatable.dart';

class QuoteEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class FetchQuote extends QuoteEvent{
}

class FetchQuoteByTag extends QuoteEvent{
  final tag;
  FetchQuoteByTag(this.tag);

  @override
  // TODO: implement props
  List<Object> get props => [tag];
}

