# google_mobile_ads_ext

[![pub package](https://img.shields.io/pub/v/google_mobile_ads_ext)](https://pub.dartlang.org/packages/google_mobile_ads_ext)


If you use [google_mobile_ads](https://pub.dev/packages/google_mobile_ads) 
you can notice that it's still missing some AdMob features.

This plugin created to cover this features until `google_mobile_ads` implements they.

## Prerequisites

You should add and setup [google_mobile_ads](https://pub.dev/packages/google_mobile_ads).

## Getting Started

To use this plugin add `google_mobile_ads_ext` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/google_mobile_ads_ext#-installing-tab-);

## Features

For now the plugin supports just video ad volume control, but you are welcome to make PR for any needed features.

### Global Settings

In native SDK you can control video ad volume and mute state.

 - [Android](https://developers.google.com/admob/android/global-settings)
 - [iOS](https://developers.google.com/admob/ios/global-settings)

**Video ad volume control**

 Plugin provide following methods:

 - `setAppVolume()` - to report the relative app volume to the Mobile Ads SDK.
 - `setAppMuted()` - to inform the SDK that the app volume has been muted.

## Usage 

You can just call static methods like:

```dart
await GoogleMobileAdsExt.setAppMuted(.8);
```

Or use extension methods for `MobileAds` (make sure that you import library):

```dart
import 'package:google_mobile_ads_ext/google_mobile_ads_ext.dart';

// some code

await MobileAds.instance.setAppVolume(true);
```

It's up to you.
