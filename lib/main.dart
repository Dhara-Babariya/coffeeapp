import 'package:coffeeapp/Activities/Home_Screen.dart';
import 'package:coffeeapp/Activities/appsliver.dart';
import 'package:coffeeapp/Activities/cart_screen.dart';
import 'package:coffeeapp/Activities/favourite.dart';
import 'package:coffeeapp/Activities/item_screen.dart';
import 'package:coffeeapp/Activities/getStarted.dart';
import 'package:coffeeapp/Activities/pro_bottom_nav.dart';
import 'package:coffeeapp/Activities/slider.dart';
import 'package:coffeeapp/Provider/favourite_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavouriteItem())],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: ProviderBottomNavPage(),
      ),
    );
  }
}
