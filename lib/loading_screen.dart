import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:job_upskill/landing_screen.dart';
import 'package:job_upskill/module.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading_screen";

  const LoadingScreen({super.key});
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  List<JobProfile> jobs = [];
  readJson() async {
    final String response = await rootBundle.loadString("assets/data.json");
    final data = await jsonDecode(response);
    for (int i = 0; i < data.length; i++) {
      jobs.add(JobProfile(
          jobProfileName: data[i]["name"], courses: data[i]["courses"]));
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LandingScreen(jobs: jobs);
    }));
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SpinKitDualRing(
          color: Colors.purple,
          size: 100.0,
        ),
      ),
    );
  }
}
