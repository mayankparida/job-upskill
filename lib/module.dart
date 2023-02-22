class JobProfile {
  JobProfile({required this.jobProfileName, required this.courses});
  String jobProfileName;
  List<dynamic> courses;
}

class DropDown {
  DropDown({required this.index, required this.jobProfileName});
  String jobProfileName;
  int index;
}
