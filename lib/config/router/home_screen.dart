import 'package:easy_localization/easy_localization.dart';
import 'package:electronic_queue/config/theme/generated/locale_keys.g.dart';
import 'package:electronic_queue/presentation/widgets/card_container_widget.dart';
import 'package:electronic_queue/presentation/widgets/row_button_container_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<BrancheModel>? branchesList;

  // initBranch() async {
  //   branchesList = await BracnhService().getAllBranches();
  //   setState(() {});
  //   log("message");
  // }

  // @override
  // void initState() {
  //   initBranch();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.novosti.tr(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Icon(Icons.notifications)
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: _buildCreditCard(
                  color: const Color.fromRGBO(12, 33, 124, 0.871),
                  cardNumber: "3546 7532 XXXX 9742",
                ),
              ),
              const SizedBox(
                height: 57,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowButtonContainerWidget(
                    text: 'Transfer',
                    icons: Icons.send_to_mobile_outlined,
                    onTapped: () {},
                  ),
                  RowButtonContainerWidget(
                    text: 'Pay',
                    icons: Icons.ios_share_outlined,
                    onTapped: () {},
                  ),
                  RowButtonContainerWidget(
                    text: 'Top-up',
                    icons: Icons.credit_card_outlined,
                    onTapped: () {},
                  ),
                  RowButtonContainerWidget(
                    text: 'More',
                    icons: Icons.more_horiz_outlined,
                    onTapped: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                LocaleKeys.poslednie_tranzaksii.tr(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const CardContainerWidget(
                cardText: 'Visa Income',
                images: 'assets/visa_icon.png',
                numText: '+2400',
              ),
              const SizedBox(
                height: 15,
              ),
              const CardContainerWidget(
                cardText: 'Mastercard',
                images: 'assets/matercard.png',
                numText: '+2400',
              )
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCreditCard({
    required Color color,
    required String cardNumber,
  }) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.all(26),
              child: Text(
                '$cardNumber',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Rectangle.png'),
                  Container(
                      height: 74,
                      width: 144,
                      child: Image.asset(
                        'assets/image 8.png',
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Column(
          children: [
            Text(
              'Balace',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '5 678,22 с',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Image.asset(
          "assets/image 10.png",
          height: 20,
          width: 95,
        ),
      ],
    );
  }
}
