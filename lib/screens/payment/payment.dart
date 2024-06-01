import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';
import '../../models/payment_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentCard> cards = [];
  String cardNo = "";
  TextEditingController cardHolderCnt = TextEditingController();
  TextEditingController cvv2Cnt = TextEditingController();
  TextEditingController expYearCnt = TextEditingController();
  TextEditingController expMonthCnt = TextEditingController();
  TextEditingController titleCnt = TextEditingController();
  bool remember = false;
  String type = "";
  loadCards() async {
    final storage = Storage();
    var cards = await storage.loadCards();
    setState(() {
      this.cards = cards;
    });
  }

  saveCard() async {
    // kontrollari saglicaksiniz

    final PaymentCard newCard = PaymentCard(
      title: titleCnt.text,
      cardHolder: cardHolderCnt.text,
      cardNo: cardNo,
      cvv2: cvv2Cnt.text,
      expMonth: int.parse(expMonthCnt.text),
      expYear: int.parse(expYearCnt.text),
    );

    List<PaymentCard> yeniKartListesi = [];

    yeniKartListesi.addAll(cards);

    yeniKartListesi.add(newCard);

    if (remember) {
      final storage = Storage();
      await storage.saveCards(yeniKartListesi);
    }

    setState(() {
      cards = yeniKartListesi;
    });

    context.pop();

    setState(() {
      remember = false;
      cardNo = "";
      cardHolderCnt.text = "";
      expMonthCnt.text = "";
      expYearCnt.text = "";
      cvv2Cnt.text = "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  showAddCard() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              title: const Text("Yeni Kart Tanimlama"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Kart Başliği",
                      labelText: "Kart Başliği",
                      alignLabelWithHint: true,
                    ),
                    controller: titleCnt,
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Ad Soyad",
                      labelText: "Ad Soyad",
                    ),
                    controller: cardHolderCnt,
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Kart No", labelText: "Kart No"),
                    onChanged: (value) {
                      setState(() {
                        cardNo = value;
                      });
                      if (value.startsWith("4")) {
                        setState(() {
                          type = "visa";
                        });
                      } else if (value.startsWith("5")) {
                        setState(() {
                          type = "master";
                        });
                      } else if (value.startsWith("9") ||
                          value.startsWith("6") ||
                          value.startsWith("3")) {
                        setState(() {
                          type = "troy";
                        });
                      } else {
                        type = "";
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ], // Only numbers can be entered
                    maxLength: 16,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Cvv2",
                            labelText: "Cvv2",
                          ),
                          obscureText: true,
                          controller: cvv2Cnt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ], // Only numbers can be entered
                          maxLength: 4,
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Bitiş Ay"),
                          controller: expMonthCnt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ], // Only numbers can be entered
                          maxLength: 2,
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Bıtış Yıl"),
                          controller: expYearCnt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ], // Only numbers can be entered
                          maxLength: 2,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  SwitchListTile(
                    title: const Text("Karti Kaydet"),
                    value: remember,
                    onChanged: (value) => setState(
                      () {
                        remember = value;
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                if (type.isNotEmpty)
                  Image.asset(
                    "assets/icons/${type}_card.png",
                    height: 40,
                  ),
                OutlinedButton(
                  onPressed: saveCard,
                  child: const Text("Onayla"),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton.outlined(
                onPressed: showAddCard, icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox.expand(
            child: cards.isEmpty
                ? const Center(child: Text("No Card found."))
                : ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) => AspectRatio(
                      aspectRatio: 1.586,
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 165, 165, 165),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                right: 10,
                                child: cards[index].cardNo.startsWith("4")
                                    ? Image.asset("assets/icons/visa_card.png",
                                        height: 60)
                                    : cards[index].cardNo.startsWith("5")
                                        ? Image.asset(
                                            "assets/icons/master_card.png",
                                            height: 60)
                                         : cards[index].cardNo.startsWith("9")
                                        ? Image.asset(
                                            "assets/icons/troy_card.png",
                                            height: 60)   
                                        : const SizedBox(),
                              ),
                              Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Text(cards[index].title)),
                              Positioned(
                                  left: 20,
                                  top: 50,
                                  child: Text(cards[index].cardNo)),
                              Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Text(cards[index].cardHolder)),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: Text(cards[index].expMonth.toString() +
                                    "/" +
                                    cards[index].expYear.toString()),
                              ),
                            ],
                          )),
                    ),
                  )),
      ),
    );
  }
}
