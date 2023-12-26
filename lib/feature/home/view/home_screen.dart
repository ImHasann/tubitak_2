// ignore_for_file: public_member_api_docs, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: const Text('Takvim'),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        const Expanded(child: CaloriWidget()),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorConstants.greyLighter,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Expanded(
                                  child: TripleWidgets(
                                    circularBarValue: '',
                                    nutritionName: '',
                                    nutritionValue: '',
                                    progressBarColor: ColorConstants.orange,
                                  ),
                                ),
                                Expanded(
                                  child: TripleWidgets(
                                    circularBarValue: '',
                                    nutritionName: '',
                                    nutritionValue: '',
                                    progressBarColor: ColorConstants.yellow,
                                  ),
                                ),
                                Expanded(
                                  child: TripleWidgets(
                                    circularBarValue: '',
                                    nutritionName: '',
                                    nutritionValue: '',
                                    progressBarColor: ColorConstants.pink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: MetricWidget(
                            dividerColor: ColorConstants.skyBlue,
                            metric: 'Water',
                            metricvalue: '2.1',
                            icon: Icons.ac_unit,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: MetricWidget(
                            dividerColor: ColorConstants.orange,
                            metric: 'Sleep',
                            metricvalue: '5',
                            icon: Icons.bed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bugünün Yemekleri',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                    ),
                    TextButton(
                      onPressed: ()  {
                         context.pushRoute(const AddMealRoute());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add),
                          Text('Öğün Ekle', style: Theme.of(context).textTheme.titleLarge?.copyWith()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      color: Colors.amber[colorCodes[index]],
                      child: const Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kahvaltı'),
                                Text('7.46'),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.star),
                                  Text('Kalori'),
                                  Text('500 KCal'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.water),
                                  Text('Kalori'),
                                  Text('500 KCal'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.car_crash),
                                  Text('Kalori'),
                                  Text('500 KCal'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     const Text('Home'),
      //     ElevatedButton(
      //       onPressed: () {
      //         context.pushRoute(const LoginRoute());
      //       },
      //       child: const Text('logine gidiş'),
      //     ),
      //     ElevatedButton(
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         await context.pushRoute(const LoginRoute());
      //       },
      //       child: const Text('Çıkış Yap'),
      //     ),
      //     ElevatedButton(
      //       onPressed: () async {
      //         await context.pushRoute(const ProfileRoute());
      //       },
      //       child: const Text('profile gidiş'),
      //     ),
      //   ],
      // ),
    );
  }
}

class CaloriWidget extends StatelessWidget {
  const CaloriWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.limeGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kalori',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorConstants.white,
                      ),
                ),
                const Icon(
                  Icons.fire_extinguisher,
                  color: ColorConstants.white,
                  size: 25,
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          color: ColorConstants.white,
                          value: 0.8,
                          strokeCap: StrokeCap.round,
                          strokeWidth: 7,
                          backgroundColor: ColorConstants.limeGreenWithOpac,
                        ),
                      ),
                    ),
                    Center(child: Text('Test')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MetricWidget extends StatelessWidget {
  const MetricWidget({
    required this.dividerColor,
    required this.metric,
    required this.metricvalue,
    required this.icon,
    super.key,
  });
  final Color dividerColor;
  final String metric;
  final String metricvalue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.greyLighter,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  metric,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                ),
                Icon(icon),
              ],
            ),
            Text(
              metricvalue,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
            ),
            Divider(
              color: dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}

class TripleWidgets extends StatelessWidget {
  const TripleWidgets({
    required this.circularBarValue,
    required this.nutritionName,
    required this.nutritionValue,
    required this.progressBarColor,
    super.key,
  });
  final String circularBarValue;
  final String nutritionName;
  final String nutritionValue;
  final Color progressBarColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          backgroundColor: ColorConstants.greyLighter,
                          color: progressBarColor,
                          value: 0.5,
                        ),
                      ),
                    ),
                    Center(child: Text(circularBarValue)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(nutritionName.isEmpty ? '0' : nutritionName),
                  Text(nutritionValue.isEmpty ? '0' : nutritionValue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
