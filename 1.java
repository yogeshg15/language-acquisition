package com.example.languageacquisition;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.dev/language_acquisition";

  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(
      (call, result) -> {
        if (call.method.equals("getLanguage")) {
          String language = getLanguage();
          result.success(language);
        } else if (call.method.equals("getNativeLanguage")) {
          String nativeLanguage = getNativeLanguage();
          result.success(nativeLanguage);
        } else if (call.method.equals("getLearningLanguage")) {
          String learningLanguage = getLearningLanguage();
          result.success(learningLanguage);
        } else {
          result.notImplemented();
        }
      }
    );
  }

  private String getLanguage() {
    // Implement logic to retrieve the user's language
    return "en-US";
  }

  private String getNativeLanguage() {
    // Implement logic to retrieve the user's native language
    return "en-US";
  }

  private String getLearningLanguage() {
    // Implement logic to retrieve the user's learning language
    return "es-ES";
  }
}