import 'package:equatable/equatable.dart';

class QuoteEventTag extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class FetchQuoteTag extends QuoteEventTag{

}
class FetchQuoteByTag extends QuoteEventTag{
  final tag;
  FetchQuoteByTag(this.tag);

  @override
  // TODO: implement props
  List<Object> get props => [tag];
}
// class FetchQuoteByTag extends QuoteEventTag{
//   final tag;
//   FetchQuoteByTag(this.tag);

//   @override
//   // TODO: implement props
//   List<Object> get props => [tag];
// }

