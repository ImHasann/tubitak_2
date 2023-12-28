// ignore_for_file: public_member_api_docs, avoid_unnecessary_containers, use_build_context_synchronously, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final usersQuery = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(child: const Text('Takvim'), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(child: CaloriWidget()),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        MetricWidget(dividerColor: ColorConstants.blackLighter, metric: 'Protein', metricvalue: '15', icon: Icons.abc),
                        MetricWidget(dividerColor: ColorConstants.blackLighter, metric: 'Protein', metricvalue: '15', icon: Icons.abc),
                        MetricWidget(dividerColor: ColorConstants.blackLighter, metric: 'Protein', metricvalue: '15', icon: Icons.abc),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Column(
                children: [
                  MetricWidget(dividerColor: Colors.red, metric: 'metri', metricvalue: '14', icon: Icons.access_alarms_rounded),
                  MetricWidget(dividerColor: Colors.red, metric: 'metri', metricvalue: '14', icon: Icons.access_alarms_rounded),
                ],
              ),
            ),
            const Expanded(child: _MealText()),
            Expanded(
                child: FirestoreListView<Movie>(
              query: moviesCollection.orderBy('title'),
              itemBuilder: (context, snapshot) {
                Movie movie = snapshot.data();
                return Text(movie.title);
              },
            )),
          ],
        ),
      ),
    );
  }
}

class _MealText extends StatelessWidget {
  const _MealText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Bugünün Yemeği'),
        Row(
          children: [
            Icon(Icons.add),
            Text('Öğün Ekle'),
          ],
        ),
      ],
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorConstants.white),
                ),
                const Icon(Icons.fire_extinguisher, color: ColorConstants.white, size: 30),
              ],
            ),
            CircularPercentIndicator(
              radius: 100,
              center: const Text('12'),
              progressColor: ColorConstants.white,
              backgroundColor: ColorConstants.limeGreenWithOpac,
              lineWidth: 10,
              percent: 0.2,
              circularStrokeCap: CircularStrokeCap.round,
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
          color: ColorConstants.metricGrey,
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
                Text(metric, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
                Icon(icon),
              ],
            ),
            Text(metricvalue, style: Theme.of(context).textTheme.titleLarge?.copyWith()),
            Divider(
              color: dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
