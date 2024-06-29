import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageAcquisitionApp extends StatefulWidget {
  @override
  _LanguageAcquisitionAppState createState() => _LanguageAcquisitionAppState();
}

class _LanguageAcquisitionAppState extends State<LanguageAcquisitionApp> {
  static const platform = MethodChannel('samples.flutter.dev/language_acquisition');

  String _language = 'Unknown';
  String _nativeLanguage = 'Unknown';
  String _learningLanguage = 'Unknown';

  Future<void> _getLanguage() async {
    final String language = await platform.invokeMethod('getLanguage');
    setState(() {
      _language = language;
    });
  }

  Future<void> _getNativeLanguage() async {
    final String nativeLanguage = await platform.invokeMethod('getNativeLanguage');
    setState(() {
      _nativeLanguage = nativeLanguage;
    });
  }

  Future<void> _getLearningLanguage() async {
    final String learningLanguage = await platform.invokeMethod('getLearningLanguage');
    setState(() {
      _learningLanguage = learningLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Language Acquisition App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Language: $_language\n'),
              Text('Native Language: $_nativeLanguage\n'),
              Text('Learning Language: $_learningLanguage\n'),
              ElevatedButton(
                child: Text('Get Language'),
                onPressed: _getLanguage,
              ),
              ElevatedButton(
                child: Text('Get Native Language'),
                onPressed: _getNativeLanguage,
              ),
              ElevatedButton(
                child: Text('Get Learning Language'),
                onPressed: _getLearningLanguage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}