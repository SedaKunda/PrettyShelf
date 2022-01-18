import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:pretty_shelf/book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pretty Shelf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pretty Shelf Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MiddleSection(),
        ));
  }
}

class MiddleSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MiddleSectionState();
  }
}

class MiddleSectionState extends State<MiddleSection> {
  Book display = Book(title: '');
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  var urlString = 'openlibrary.org';
  var urlEndpointString = '/isbn/';

  Widget futureWidgetOnButtonPress() {
    return Expanded(child: FutureBuilder<List<Book>>(builder: (context, snapshot) {
      return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Visibility(
              visible: _isVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title: ${display.title}'),
                  Text('Classification: ${display.subjects.toString()}'),
                  Text('Publisher: ${display.publishers}'),
                ],
              )));
    }));
  }

  Future<Null> fetchBooks() async {
    var url = Uri.https(urlString, urlEndpointString + myController.text + '.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = Book.fromJson(convert.jsonDecode(response.body));
      setState(() {
        display = jsonResponse;
        _isVisible = true;
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'ISBN',
                  ),
                  validator: formValidator,
                  controller: myController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    fetchBooks();
                  }
                },
                child: const Text('Search'),
                style: buttonStyle(),
              )
            ],
          ),
          futureWidgetOnButtonPress()
        ]));
  }

  String? formValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an ISBN';
    }
    return null;
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white));
  }
}
