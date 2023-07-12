import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quoteEvent.dart';
import 'package:project4/blocs/quoteBloc/quoteState.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/repository/quoteRepository.dart';
import 'quote.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(QuoteIsLoading());

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchQuoteByTag) {
      yield QuoteIsLoading();
      try {
        List<QuoteModel> quote =
            await quoteRepository.getQuotesByTag(event.tag);
        print("by tag: " + quote[1].quote);
        yield QuoteIsLoaded(quote);
      } catch (_) {
        print('by tag error');
        yield QuoteIsNotLoaded();
      }
    } else if (event is FetchQuote) {
      yield QuoteIsLoading();
      try {
        List<QuoteModel> quote = await quoteRepository.getQuotes();
        yield QuoteIsLoaded(quote);
      } catch (_) {
        yield QuoteIsNotLoaded();
      }
    } else if (event is QuoteEventRefresh) {
      yield QuoteStateRefreshing();
      try {
        final quotes = await quoteRepository.getQuotes();

        await Future<void>.delayed(Duration(seconds: 3));

        yield QuoteIsLoaded(quotes);
      } catch (_) {
        yield QuoteIsNotLoaded();
      }
    }
  }
}
