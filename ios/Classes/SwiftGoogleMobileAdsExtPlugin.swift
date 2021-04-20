import Flutter
import UIKit
import GoogleMobileAds

/// Plugin methods.
enum PluginMethod: String {
    case setAppMuted, setAppVolume
}

public class SwiftGoogleMobileAdsExtPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "google_mobile_ads_ext", binaryMessenger: registrar.messenger())
        let instance = SwiftGoogleMobileAdsExtPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let method = PluginMethod(rawValue: call.method) else {
            result(FlutterMethodNotImplemented)
            return
        }
        
        switch method {
        case .setAppMuted:
            guard let val = call.arguments as? Bool else {
                result(FlutterError(code: "INVALID_ARGS",
                                    message: "Arguments is invalid",
                                    details: nil))
                return
            }
            
            GADMobileAds.sharedInstance().applicationMuted = val
            result(nil)
        case .setAppVolume:
            guard let val = call.arguments as? Float else {
                result(FlutterError(code: "INVALID_ARGS",
                                    message: "Arguments is invalid",
                                    details: nil))
                return
            }
            
            GADMobileAds.sharedInstance().applicationVolume = val
            result(nil)
            
        }
    }
}
