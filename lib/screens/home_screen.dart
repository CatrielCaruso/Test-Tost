import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/providers.dart';
import 'package:test_tots/helpers/dialog_helper.dart';
import 'package:test_tots/theme/custom_style_theme.dart';
import 'package:test_tots/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final readHomeProvider = context.read<HomeProvider>();
  late final watchHomeProvider = context.watch<HomeProvider>();

  @override
  void initState() {
    initFetch();
    super.initState();
  }

  Future<void> initFetch() async {
    try {
      readHomeProvider.getClients();
    } catch (e) {
      DialogHelper.customShowDialog(context: context, text: 'Unexpected error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/img/home_top.png'),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height * 0.22,
              child: Image.asset('assets/img/home_center.png'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/img/home_bottom_right.png'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/img/home_bottom_left.png'),
            ),
            (watchHomeProvider.initialLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 34,
                          ),
                          Image.asset('assets/img/minimal_text.png'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/img/client_text.png')
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: InputSearchWidget(
                                  hint: 'Search...',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: const BoxDecoration(
                                  color: CustomStylesTheme.textDarkColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomStylesTheme.shadowColor,
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                      blurRadius: 15.0,
                                    ), //BoxShadow
                                    //BoxShadow
                                  ],
                                ),
                                child: const Text(
                                  'ADD NEW',
                                  style: TextStyle(
                                      fontFamily:
                                          CustomStylesTheme.fontFamilyDMsans,
                                      fontSize: 13,
                                      fontWeight:
                                          CustomStylesTheme.fontWeightMedium,
                                      color: CustomStylesTheme.whiteColor),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 20),
                            decoration: BoxDecoration(
                              color: CustomStylesTheme.whiteColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(
                                  color: CustomStylesTheme.blackColor,
                                  width: 1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Jane Cooper',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: CustomStylesTheme
                                                .fontFamilyDMsans,
                                            fontWeight: CustomStylesTheme
                                                .fontWeightMedium,
                                            overflow: TextOverflow.clip),
                                      ),
                                      Text(
                                        'alma.lawson@example.com',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: CustomStylesTheme
                                                .fontFamilyDMsans,
                                            fontWeight: CustomStylesTheme
                                                .fontWeightSmall,
                                            overflow: TextOverflow.clip),
                                      )
                                    ],
                                  ),
                                ),
                                Image.asset('assets/img/ic_more.png'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: CustomButtomWidget(title: 'LOAD MORE'),
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
