import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/blocs/Example/postBlocTest.dart';
import 'package:project4/blocs/Example/postEvent.dart';
import 'package:project4/blocs/Example/postState.dart';
import 'package:project4/models/QuoteModel.dart';
import 'package:project4/widgets/SplashScreenWidget.dart';

class DisplayContentPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DisplayContentPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  _HomePageState() {
    _scrollController.addListener(_onScroll);


  }

  @override
  Widget build(BuildContext context) {
    final PostBloc _postBloc = BlocProvider.of<PostBloc>(context);

     return Container(
       child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostUninitialized) {
            return Center(
              child: LoadingWidget(),
            );
          }
          if (state is PostError) {
            return Center(
              child: Text('failed to fetch posts'),
            );
          }
          if (state is PostLoaded) {
            if (state.posts.isEmpty) {
              return Center(
                child: Text('no posts'),
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length ? BottomLoader() : PostWidget(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
              controller: _scrollController,
            );
          }else{
            return Text("some data");
          }
        },
    ),
     );
  }

  @override
  void dispose() {
//    _postBloc.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      BlocProvider.of<PostBloc>(context).add(Fetch());

    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: ButtomLoadingWidget(
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final QuoteModel post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        post.id.toString(),
        style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),
      ),
      title: Text('${post.quote_writer}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      isThreeLine: true,
      subtitle: Text(post.quote),
      dense: true,
    );
  }
}