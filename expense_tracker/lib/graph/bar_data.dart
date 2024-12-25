import 'package:expense_tracker/graph/inidividual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  BarData(
      {required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thuAmount,
      required this.friAmount,
      required this.satAmount});

  List<InidividualBar> barData = [];

  void initializeData() {
    barData = [
      InidividualBar(x: 0, y: sunAmount),
      InidividualBar(x: 1, y: monAmount),
      InidividualBar(x: 2, y: tueAmount),
      InidividualBar(x: 3, y: wedAmount),
      InidividualBar(x: 4, y: thuAmount),
      InidividualBar(x: 5, y: friAmount),
      InidividualBar(x: 6, y: satAmount),
    ];
  }
}
