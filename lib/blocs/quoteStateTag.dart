import 'package:equatable/equatable.dart';
import 'package:project4/models/QuoteModel.dart';


class QuoteStateTag extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class QuoteIsLoading extends QuoteStateTag{
}

class QuoteIsLoadedt extends QuoteStateTag{
  final List<QuoteModel> _quotes;

  QuoteIsLoadedt(this._quotes);
  List<QuoteModel> get getQuotesTag => _quotes;

  @override
  // TODO: implement props
  List<Object> get props => [_quotes];

}
class QuoteIsNotLoaded extends QuoteStateTag{}

