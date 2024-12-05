import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolapp/view/tab/student_page.dart';
import 'package:schoolapp/view/tab/teacher_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(color: Colors.black45),
                        ),
                        Text(
                          'Name of the Person',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Icon(Icons.notifications_none_outlined)
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                SearchBar(
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  leading: const Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Icon(Icons.search)),
                  elevation: const WidgetStatePropertyAll(0),
                  constraints: const BoxConstraints(
                    minHeight: 45,
                  ),
                  hintText: 'search',
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Academics',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: screenHeight * 0.6,
                  child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: [
                      _buildContainer(
                          context: context,
                          destinationpage: const StudentPage(),
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/student.png',
                          title: 'Students'),
                      _buildContainer(
                          context: context,
                          destinationpage: const TeacherPage(),
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/teacher.png',
                          title: 'Teachers'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/attendance.png',
                          title: 'Attendance'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/syllabus.png',
                          title: 'Syllabus'),
                      _buildContainer(
                        textSize: screenWidth * 0.025,
                        icontype: 'assets/timetable.png',
                        title: 'Time Table',
                      ),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/assignment.png',
                          title: 'Assignment'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/exam.png',
                          title: 'Exams'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/result.png',
                          title: 'Results'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/fee.png',
                          title: 'Fees'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/event.png',
                          title: 'Events'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/inbox.png',
                          title: 'Inbox'),
                      _buildContainer(
                          textSize: screenWidth * 0.025,
                          icontype: 'assets/doubt.png',
                          title: 'Ask Doubt'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'E-Learning',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFooterContainer(image: 'assets/laptop.png'),
                    _buildFooterContainer(image: 'assets/laptop1.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_buildContainer({
  required String icontype,
  required String title,
  required double textSize,
  BuildContext? context,
  Widget? destinationpage,
}) {
  return SizedBox(
    child: InkWell(
      onTap: () {
        Navigator.push(context!,
            MaterialPageRoute(builder: (context) => destinationpage!));
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
              padding: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Image(image: AssetImage(icontype)),
                    )),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: textSize, fontWeight: FontWeight.w700),
                    ),
                  ])),
        ),
      ),
    ),
  );
}

_buildFooterContainer({
  required String image,
}) {
  return Flexible(
      child: Container(
    height: 90,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        image: DecorationImage(image: AssetImage(image))),
  ));
}
