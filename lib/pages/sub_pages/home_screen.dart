// ignore_for_file: camel_case_types

import 'package:backpack_pal/route_list.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: RoutesListView(),
    );
  }
}
