import 'package:flutter/material.dart';
import 'package:starter_app/W7-S1/model/submission.dart';
import 'package:starter_app/W7-S1/quiz_app.dart';
import 'package:starter_app/W7-S1/widgets/resultcard.dart';

class ResultScreen extends StatelessWidget {
  final Function navigate;
  final Submission submission;
  const ResultScreen(
      {super.key, required this.submission, required this.navigate});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Your score is ${submission.getScore()} / ${submission.answers.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: submission.answers.length,
              itemBuilder: (context, i) {
                var question = submission.answers.keys.elementAt(i);
                return Resultcard(
                  question: question,
                  answer: submission.answers[question],
                  index: i,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              submission.removeAnswers();
              navigate(Screens.welcomeScreen);
            },
            child: const Text("Restart Quiz"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Widget resultCard(Question question, int index, Answer? answer) {
//   return Card(
//     margin: const EdgeInsets.all(20),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 backgroundColor: answer?.userAnswer == question.goodAnswer
//                     ? Colors.green
//                     : Colors.red,
//                 child: Text((index + 1).toString()),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   question.title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 50),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: question.possibleAnswers
//                   .map(
//                     (possibleAnswer) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: Row(
//                         children: [
//                           question.goodAnswer == possibleAnswer
//                               ? const Icon(
//                                   Icons.check,
//                                   color: Colors.green,
//                                   size: 20,
//                                 )
//                               : Container(width: 20),
//                           const SizedBox(width: 10),
//                           Text(
//                             possibleAnswer,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: possibleAnswer == answer?.userAnswer
//                                   ? (possibleAnswer == question.goodAnswer
//                                       ? Colors.green
//                                       : Colors.red)
//                                   : Colors.black,
//                               fontWeight: possibleAnswer == answer?.userAnswer
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
