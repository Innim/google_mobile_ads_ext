import Flutter
import UIKit

public class SwiftGoogleMobileAdsExtPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "google_mobile_ads_ext", binaryMessenger: registrar.messenger())
    let instance = SwiftGoogleMobileAdsExtPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // TODO: implement
  }
}
