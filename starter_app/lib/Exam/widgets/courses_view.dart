import 'package:flutter/material.dart';
import 'package:starter_app/Exam/Models/course.dart';
import 'package:starter_app/Exam/data/dummy_data.dart';
import 'package:starter_app/Exam/widgets/course_view.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  void detaillView(Course course) async {
    final Course? newCourse = await Navigator.of(context).push<Course>(
      MaterialPageRoute(
        builder: (ctx) => CourseView(
          course: course,
        ),
      ),
    );
    if (newCourse != null) {
      setState(() {
        int updatedCourse = dummyCourse.indexOf(newCourse);
        dummyCourse[updatedCourse] = newCourse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("No Courses"));

    if (dummyCourse.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyCourse.length,
        itemBuilder: (context, index) {
          var course = dummyCourse[index];
          return CustomCard(
            onTap: () => detaillView(course),
            course: course,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Score App"),
        backgroundColor: Colors.blue,
      ),
      body: content,
    );
  }
}

class CustomCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;
  const CustomCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final int scoreCount = course.scores.length;
    final double averageScore = course.getAverageScore();

    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(course.course),
          subtitle: averageScore == 0
              ? const Text("No score")
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$scoreCount scores"),
                    Text(" Average: $averageScore")
                  ],
                ),
        ),
      ),
    );
  }
}
