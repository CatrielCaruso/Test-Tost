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
      DialogHelper.customSnackBar(
          context: context, text: 'Unexpected error', color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                              Expanded(
                                child: InputSearchWidget(
                                  onSearch: readHomeProvider.onSearchClient,
                                  focusNode: readHomeProvider.focusNode,
                                  onTapOutside: (event) =>
                                      readHomeProvider.focusNode.unfocus(),
                                  hint: 'Search...',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => readHomeProvider.goToAbmClient(
                                    context: context),
                                child: Container(
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
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...readHomeProvider.searchClients.map((e) =>
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 20),
                                        decoration: BoxDecoration(
                                          color: CustomStylesTheme.whiteColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                              color:
                                                  CustomStylesTheme.blackColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/img/client_placeholder.png')),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    e.fullName,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            CustomStylesTheme
                                                                .fontFamilyDMsans,
                                                        fontWeight:
                                                            CustomStylesTheme
                                                                .fontWeightMedium,
                                                        overflow:
                                                            TextOverflow.clip),
                                                  ),
                                                  Text(
                                                    e.email!,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            CustomStylesTheme
                                                                .fontFamilyDMsans,
                                                        fontWeight:
                                                            CustomStylesTheme
                                                                .fontWeightSmall,
                                                        overflow:
                                                            TextOverflow.clip),
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 200,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: CustomStylesTheme
                                                            .yellowColor,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 20,
                                                                    top: 20,
                                                                    bottom: 30),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.close,
                                                                    color: CustomStylesTheme
                                                                        .blackColor,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => readHomeProvider.goToAbmClientUpdate(
                                                                        client:
                                                                            e,
                                                                        context:
                                                                            context),
                                                                    child:
                                                                        CustomButtomOpcion(
                                                                      text:
                                                                          'Edit',
                                                                      color: CustomStylesTheme
                                                                          .blackColor,
                                                                      image: Image
                                                                          .asset(
                                                                              'assets/img/ic_create.png'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: ()async {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      await readHomeProvider.onDelete(
                                                                          context:
                                                                              context,
                                                                          idClient:
                                                                              e.id!);
                                                                    },
                                                                    child:
                                                                        const CustomButtomOpcion(
                                                                      text:
                                                                          'Delete',
                                                                      color: CustomStylesTheme
                                                                          .redColor,
                                                                      image:
                                                                          Icon(
                                                                        Icons
                                                                            .delete_forever,
                                                                        color: CustomStylesTheme
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Image.asset(
                                                  'assets/img/ic_more.png'),
                                            ),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: GestureDetector(
                                        onTap: () =>
                                            readHomeProvider.onLoadClints(),
                                        child: const CustomButtomWidget(
                                            title: 'LOAD MORE')),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
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
