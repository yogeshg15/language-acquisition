import UIKit
import Flutter

class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let languageChannel = FlutterMethodChannel(name: "samples.flutter.dev/language_acquisition",
                                               binaryMessenger: controller.binaryMessenger)
    languageChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "getLanguage" {
        let language = self.getLanguage()
        result(language)
      } else if call.method == "getNativeLanguage" {
        let nativeLanguage = self.getNativeLanguage()
        result(nativeLanguage)
      } else if call.method == "getLearningLanguage" {
        let learningLanguage = self.getLearningLanguage()
        result(learningLanguage)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getLanguage() -> String {
    // Implement logic to retrieve the user's language
    return "en-US"
  }

  private func getNativeLanguage() -> String {
    // Implement logic to retrieve the user's native language
    return "en-US"
  }
