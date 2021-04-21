import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleMobileAdsExt {
  static const _channel = MethodChannel('google_mobile_ads_ext');
  static const _methodSetAppMuted = 'setAppMuted';
  static const _methodSetAppVolume = 'setAppVolume';

  /// Set audio volumes of all ads relative to other audio output.
  ///
  /// Valid ad volume values range from `0.0` (silent) to `1.0` (current device volume).
  /// Use this method only if your application has its own volume controls
  /// (e.g., custom music or sound effect volumes).
  ///
  /// Defaults to `1.0`.
  static Future<void> setAppVolume(double value) async {
    assert(value != null);
    assert(value >= 0 && value <= 1);

    await _channel.invokeMethod<void>(_methodSetAppVolume, value);
  }

  /// Set initial mute state for all ads.
  ///
  /// Use this method only if your application has its own volume controls
  /// (e.g., custom music or sound effect muting).
  ///
  /// Defaults to `false`.
  // ignore: avoid_positional_boolean_parameters
  static Future<void> setAppMuted(bool value) async {
    assert(value != null);

    await _channel.invokeMethod<void>(_methodSetAppMuted, value);
  }
}

extension MobileAdsExtension on MobileAds {
  /// Set audio volumes of all ads relative to other audio output.
  ///
  /// Valid ad volume values range from `0.0` (silent) to `1.0` (current device volume).
  /// Use this method only if your application has its own volume controls
  /// (e.g., custom music or sound effect volumes).
  ///
  /// Defaults to `1.0`.
  Future<void> setAppVolume(double value) =>
      GoogleMobileAdsExt.setAppVolume(value);

  /// Set initial mute state for all ads.
  ///
  /// Use this method only if your application has its own volume controls
  /// (e.g., custom music or sound effect muting).
  ///
  /// Defaults to `false`.
  // ignore: avoid_positional_boolean_parameters
  Future<void> setAppMuted(bool value) => GoogleMobileAdsExt.setAppMuted(value);
}
