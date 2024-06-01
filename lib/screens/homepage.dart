import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeproje/bloc/client/client_cubit.dart';
import 'package:vizeproje/core/localizations.dart';
import 'package:vizeproje/screens/product/CategoryPage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key});
  @override
  State<homepage> createState() => _HomePageState();
}

class _HomePageState extends State<homepage> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: () {
                if (clientCubit.state.language == "tr") {
                  clientCubit.changeLanguage(language: "en");
                } else {
                  clientCubit.changeLanguage(language: "tr");
                }
              },
              icon: Icon(Icons.language),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: () => GoRouter.of(context).push("/favorites"),
              icon: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      //appbar
      //drawer
      drawer: Drawer(
        child: Column(
          children: [
            InkWell(
              onTap: () => context.push("/profile"),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pp.png'),
                      radius: 35,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Serap & Ceylan',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MenuItem(
                    title: "Anasayfa",
                    icon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      height: 23,
                    ),
                    onTap: () => context.push("/homepage"),
                  ),
                  MenuItem(
                    title: "Favoriler",
                    icon: SvgPicture.asset(
                      "assets/icons/love.svg",
                      height: 23,
                    ),
                    onTap: () => context.push("/favorites")
                  ),
                  MenuItem(
                      title: "Kartlarım",
                      icon: SvgPicture.asset(
                        "assets/icons/credit-card.svg",
                        height: 23,
                      ),
                      onTap: () => context.push("/payment")),
                  MenuItem(
                      title: "Sepetim",
                      icon: SvgPicture.asset(
                        "assets/icons/trolley.svg",
                        height: 23,
                      ),
                      onTap: () => context.push("/cart")),
                  MenuItem(
                      title: "Ürünler",
                      icon: SvgPicture.asset(
                        "assets/icons/shop.svg",
                        height: 23,
                      ),
                      onTap: () => context.push("/products")),
                  MenuItem(
                      title: "Ürün Detayları",
                      icon: SvgPicture.asset(
                        "assets/icons/file.svg",
                        height: 22,
                      ),
                      onTap: () => context.push("/silincek")),
                    MenuItem(
                      title: "Hata Sayfası",
                      icon: SvgPicture.asset(
                        "assets/icons/404.svg",
                        height: 22,
                      ),
                      onTap: () => context.push("/deneme")),
                                        
                  MenuItem(
                      title: "Hakkımızda",
                      icon: SvgPicture.asset(
                        "assets/icons/about.svg",
                        height: 23,
                      ),
                      onTap: () => context.push("/about")),
                  Gap(5),
                  
                ],
              ),
            ),
            Padding(
  padding: const EdgeInsets.all(8.0),
  child: InkWell(
    onTap: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Icon(Icons.settings),
                Text(
                        AppLocalizations.of(context).getTranslate("Ayarlar")),
                SwitchListTile(
                  value: clientCubit.state.darkMode,
                  onChanged: (value) {
                    clientCubit.changeDarkMode(darkMode: value);
                  },
                  secondary: clientCubit.state.darkMode
                      ? const Icon(Icons.sunny)
                      : const Icon(Icons.nightlight),
                  title: const Text('Gece Modu'),
                ),
                SwitchListTile(
                  value: clientCubit.state.language == "tr",
                  onChanged: (_) {
                    if (clientCubit.state.language == "tr") {
                      clientCubit.changeLanguage(
                          language: "en");
                    } else {
                      clientCubit.changeLanguage(
                          language: "tr");
                    }
                  },
                  title: const Text("Dil Seçimi"),
                  subtitle: clientCubit.state.language == "en"
                      ? const Text("English (United States)")
                      : const Text("Turkish (Turkiye)"),
                  secondary: const Icon(Icons.language),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Kapat'),
                ),
              ],
            ),
          );
        },
      );
    },
    child: Row(
      children: [
        Icon(Icons.settings),
        SizedBox(width: 8), // Araya boşluk ekleyebilirsiniz.
        Text(
                        AppLocalizations.of(context).getTranslate("Ayarlar")),      ],
    ),
  ),
),

            Divider(),
            MenuItem(
              icon: Icon(Icons.logout_outlined),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/welcome', (route) => false);
              },
              title: "Çıkış",
            ),
          ],
        ),
      ),
      //drawer
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2),
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FadeInUp(
                                    duration: Duration(milliseconds: 1500),
                                    child: Text(
                                      "Our New Products",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1700),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "VIEW MORE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            FadeInUp(
                duration: Duration(milliseconds: 1400),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Categories",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("All")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeCategory(
                                image: 'assets/images/beauty.jpg',
                                title: 'Beauty',
                                tag: 'beauty'),
                            makeCategory(
                                image: 'assets/images/clothes.jpg',
                                title: 'Clothes',
                                tag: 'clothes'),
                            makeCategory(
                                image: 'assets/images/perfume.jpg',
                                title: 'Perfume',
                                tag: 'perfume'),
                            makeCategory(
                                image: 'assets/images/glass.jpg',
                                title: 'Glass',
                                tag: 'glass'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Best Selling by Category",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("All")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeBestCategory(
                                image: 'assets/images/tech.jpg', title: 'Tech'),
                            makeBestCategory(
                                image: 'assets/images/watch.jpg',
                                title: 'Watch'),
                            makeBestCategory(
                                image: 'assets/images/perfume.jpg',
                                title: 'Perfume'),
                            makeBestCategory(
                                image: 'assets/images/glass.jpg',
                                title: 'Glass'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget makeCategory({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryPage(
                          image: image,
                          title: title,
                          tag: tag,
                        )));
          },
          child: Material(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeBestCategory({image, title}) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.0),
              ])),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final Function()? onTap;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            SizedBox(width: 6),
            Text( AppLocalizations.of(context).getTranslate(title)),
          ],
        ),
      ),
    );
  }
}
