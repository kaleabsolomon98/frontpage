
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/quoteBlocTag.dart';
import 'package:project4/blocs/quoteEventTag.dart';
import 'package:project4/blocs/quoteStateTag.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/repository/quoteRepository.dart';
import 'package:project4/repository/quoteRepository1.dart';
import './quoteTag.dart';


class QuoteBlocTag extends Bloc<QuoteEventTag,QuoteStateTag>{
  QuoteRepository1 quoteRepository;

  QuoteBlocTag(this.quoteRepository) : super(QuoteIsLoading());



  @override
  Stream<QuoteStateTag> mapEventToState(QuoteEventTag event) async* {
    // if(event is FetchQuoteByTag){
    //   try{
    //     List<QuoteModel> quote = await quoteRepository.getQuotesByTag(event.tag);
    //     yield QuoteIsLoadedt(quote);

    //   }catch(_) {
    //     yield QuoteIsNotLoaded();
    //   }
       if(event is FetchQuoteTag){   
      try{
        print("tryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
        List<QuoteModel> quote = await quoteRepository.getQuotesTag();
        print("lastDebug"+ quote.toString());
        yield QuoteIsLoadedt(quote);
        

      }catch(_) {
        print("catchcccccccccccccccccc");
        yield QuoteIsNotLoaded();
      }
    }
        
      }
     
  
  }

