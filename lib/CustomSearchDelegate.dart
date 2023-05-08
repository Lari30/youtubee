import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          close(context, "");
        },
      ),
    ]);

    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  //throw UnimplementedError();
}

@override
Widget buildSuggestions(BuildContext context) {
  //print("resultado: digitado " + query);
  return Container();
  throw UnimplementedError();
}
