import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBloc/quoteEvent.dart';
import 'package:project4/blocs/quoteBloc/quoteState.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/repository/quoteRepository.dart';
import 'quote.dart';


class QuoteBloc extends Bloc<QuoteEvent,QuoteState>{
  QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(QuoteIsLoading());



  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    // TODO: implement mapEventToState
    if(event is FetchQuoteByTag){
      try{
        List<QuoteModel> quote = await quoteRepository.getQuotesByTag(event.tag);
        yield QuoteIsLoaded(quote);

      }catch(_) {
        yield QuoteIsNotLoaded();
      }
    }else if(event is FetchQuote){
      yield QuoteIsLoading();
      try{
        List<QuoteModel> quote = await quoteRepository.getQuotes();
        yield QuoteIsLoaded(quote);

      }catch(_) {
        yield QuoteIsNotLoaded();
      }
    }else if(event is QuoteDetailEvent){
      yield QuoteIsLoading();
      try{


      }catch(e){
        yield QuoteIsNotLoaded();
      }

    }
  }

}