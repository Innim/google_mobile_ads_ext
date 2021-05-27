import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_mobile_ads_ext/google_mobile_ads_ext.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _value = 1;
  bool _muted = false;
  bool _pending = false;

  @override
  Widget build(BuildContext context) {
    final nextVal = _value == 1 ? .5 : 1.0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) {
            Widget res = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(_muted ? 'Unmute' : 'Mute'),
                    onPressed: () async {
                      final val = !_muted;

                      await GoogleMobileAdsExt.setAppMuted(val);
                      // alternative:
                      // await MobileAds.instance.setAppMuted(val);

                      setState(() {
                        _muted = val;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('Set volume $nextVal'),
                    onPressed: () async {
                      await GoogleMobileAdsExt.setAppVolume(nextVal);
                      // alternative:
                      // await MobileAds.instance.setAppVolume(val);

                      _showMessage(context, 'Volume was set to $nextVal.');

                      setState(() {
                        _value = nextVal;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Show Ad'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellowAccent,
                      primary: Colors.black54,
                    ),
                    onPressed: _showAds,
                  ),
                ],
              ),
            );

            if (_pending) {
              res = Stack(
                children: [
                  res,
                  _buildPending(context),
                ],
              );
            }

            return res;
          },
        ),
      ),
    );
  }

  Widget _buildPending(BuildContext context) {
    return Stack(
      children: const [
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.grey),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  Future<void> _showAds() async {
    _setPending(true);

    // Interstitial Video:
    const adId = 'ca-app-pub-3940256099942544/8691691433';
    final interstitialAd = InterstitialAd(
      adUnitId: adId,
      request: const AdRequest(),
      listener: AdListener(
        onAdLoaded: (ad) {
          (ad as InterstitialAd).show();
        },
        onAdClosed: (ad) => _setPending(false),
        onAdFailedToLoad: (ad, error) => _setPending(false),
      ),
    );

    await interstitialAd.load();
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  void _setPending(bool value) {
    setState(() {
      _pending = value;
    });
  }
}
