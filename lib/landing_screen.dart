import 'package:flutter/material.dart';
import 'package:job_upskill/module.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'dart:html' as html;

// ignore: must_be_immutable
class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key, required this.jobs}) : super(key: key);
  List<JobProfile> jobs;

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  int index = 0;
  String jobProfileName = "";
  List<dynamic> courses = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.purple, Colors.blue.shade900])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
              child: Text("Job Profile Upskilling Using Hadoop MapReduce")),
        ),
        body: Column(children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Job Profile",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: DropdownSearch<DropDown>(
              dropdownSearchDecoration: InputDecoration(
                labelText: "",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(width: 0.5, color: Colors.purple),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(width: 0.5, color: Colors.purple)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(width: 0.5, color: Colors.purple)),
                hintText: "",
                isDense: true,
              ),
              searchBoxDecoration: InputDecoration(
                labelText: "",
                labelStyle: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(width: 0.5, color: Colors.purple),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(width: 0.5, color: Colors.purple)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.blue.shade900)),
                hintText: "Search Job Profile",
                hintStyle: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                isDense: true,
              ),
              dropdownButtonBuilder: (_) => const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 18.0,
                  color: Colors.blueGrey,
                ),
              ),
              popupItemBuilder:
                  (BuildContext context, DropDown temp, bool value) {
                return Tooltip(
                  message: temp.jobProfileName,
                  child: ListTile(
                    title: Text(
                      temp.jobProfileName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              dropdownBuilder:
                  (BuildContext context, DropDown? temp, String? ok) {
                return temp == null
                    ? Text(
                        "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        temp.jobProfileName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      );
              },
              showSearchBox: true,
              mode: Mode.MENU,
              showSelectedItem: false,
              searchBoxStyle: TextStyle(
                  color: Colors.blue.shade900, fontWeight: FontWeight.bold),
              itemAsString: (DropDown temp) => temp.jobProfileName,
              items: List.generate(
                  widget.jobs.length,
                  (index) => DropDown(
                      index: index,
                      jobProfileName: widget.jobs[index].jobProfileName)),
              onChanged: (value) {
                setState(() {
                  index = value?.index ?? 0;
                  jobProfileName = value?.jobProfileName ?? "";
                  courses = widget.jobs[index].courses;
                });
              },
              selectedItem: DropDown(
                index: index,
                jobProfileName: jobProfileName,
              ),
            ),
          ),
          Expanded(
            child: GridView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 120,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0.0,
                ),
                children: List<Widget>.generate(
                  courses.length,
                  (count) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.purple,
                                        Colors.blue.shade900
                                      ]),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Center(
                                child: Text(
                                  "${count + 1}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${courses[count]}",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.blue.shade900,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MaterialButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            html.window.open(
                                                'https://www.udemy.com/courses/search/?src=ukw&q=${courses[count]}',
                                                "_blank");
                                          },
                                          child: Text("Udemy")),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      MaterialButton(
                                          color: Colors.blue,
                                          onPressed: () {
                                            html.window.open(
                                                'https://in.coursera.org/search?query=${courses[count]}',
                                                "_blank");
                                          },
                                          child: Text("Coursera")),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
