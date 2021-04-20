#import "GoogleMobileAdsExtPlugin.h"
#if __has_include(<google_mobile_ads_ext/google_mobile_ads_ext-Swift.h>)
#import <google_mobile_ads_ext/google_mobile_ads_ext-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "google_mobile_ads_ext-Swift.h"
#endif

@implementation GoogleMobileAdsExtPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGoogleMobileAdsExtPlugin registerWithRegistrar:registrar];
}
@end
