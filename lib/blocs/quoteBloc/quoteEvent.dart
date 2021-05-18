import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class QuoteDetailEvent extends QuoteEvent{
  final position;

  QuoteDetailEvent(this.position);

  @override
  // TODO: implement props
  List<Object> get props => [position];
}

