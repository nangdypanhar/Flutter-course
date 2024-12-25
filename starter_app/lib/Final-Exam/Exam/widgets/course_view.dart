import 'package:flutter/material.dart';
import 'package:starter_app/Exam/Models/course.dart';
import 'package:starter_app/Exam/widgets/score_form.dart';

class CourseView extends StatefulWidget {
  final Course course;
  const CourseView({super.key, required this.course});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  void _addItem() async {
    final StudentScore? newStudent =
        await Navigator.of(context).push<StudentScore>(
      MaterialPageRoute(
        builder: (ctx) => const ScoreForm(),
      ),
    );
    if (newStudent != null) {
      setState(() {
        widget.course.scores.add(newStudent);
      });
      Navigator.pop(context, widget.course);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.course.course),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: widget.course.scores.length,
        itemBuilder: (context, index) {
          var student = widget.course.scores[index];

          return StudentTile(studentSscore: student);
        },
      ),
    );
  }
}

class StudentTile extends StatelessWidget {
  final StudentScore studentSscore;
  const StudentTile({super.key, required this.studentSscore});

  @override
  Widget build(BuildContext context) {
    final double score = studentSscore.score;

    Color setColor(double score) {
      if (score <= 30) {
        return Colors.red;
      } else if (score > 30 && score <= 50) {
        return Colors.orange;
      }
      return Colors.green;
    }

    return ListTile(
      title: Text(studentSscore.name),
      trailing: Text(
        score.toString(),
        style: TextStyle(color: setColor(score)),
      ),
    );
  }
}
