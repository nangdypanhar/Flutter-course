import 'package:starter_app/Exam/Models/course.dart';

final List<Course> dummyCourse = [
  Course(
    course: "Flutter ",
    scores: [
      StudentScore(score: 100, name: "Ronan"),
      StudentScore(score: 50, name: "Nangdy Panhar"),
      StudentScore(score: 30, name: "Vannda")
    ],
  ),
  Course(
    course: "Web Development",
    scores: [
      StudentScore(score: 0, name: "Nangdy Panhar"),
      StudentScore(score: 0, name: "Ronan"),
      StudentScore(score: 0, name: "Vannda")
    ],
  )
];
