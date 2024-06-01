// import 'package:flutter/material.dart';


// import 'screens/buy.dart';
// import 'screens/giris.dart';
// import 'screens/homepage.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shopping',
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/homepage': (context) => homepage(),
//         //'/login':(context) => loginscreen(),
//         //'/profil':(context) => profilscreen(),
//         //'/welcome': (context) => welcomescreen(),
//         '/giris':(context) => giris(),
//         //'/shop':(context) => shop(),
//         //'/about': (context) => about(),
//         //'/bag': (context) => bag(),
//         //'/clothes': (context) => clothes(),
//         '/buy':(context) =>buy()

//       },
//       initialRoute: '/giris',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
//         useMaterial3: true,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:vizeproje/bloc/cart/cart_cubit.dart';
import 'package:vizeproje/bloc/client/client_cubit.dart';
import 'package:vizeproje/bloc/products/products_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localizations.dart';
import 'core/routes.dart';
import 'core/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ClientCubit(
                  ClientState(darkMode: false, language: "en"),
                )),
        BlocProvider(
            create: (context) => CartCubit(
                  CartState(sepet: []),
                )),
        BlocProvider(
            create: (context) => ProductsCubit(
                  ProductsState(favorites: []),
                )),
      ],
      child: BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
          themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
          ],
          locale: Locale(state.language),
        );
      }),
    );
  }
}
