import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Currency { EURO, RIELS, DONG }

void main() {
  runApp(const ConvertApp());
}

class ConvertApp extends StatefulWidget {
  const ConvertApp({super.key});

  @override
  State<ConvertApp> createState() => _ConvertAppState();
}

class _ConvertAppState extends State<ConvertApp> {
  TextEditingController amoutController = TextEditingController();

  Currency selectedCurrency = Currency.RIELS;

  @override
  void dispose() {
    amoutController.dispose();
    super.dispose();
  }

  double convertedCurrency() {
    double amout = double.tryParse(amoutController.text) ?? 0.0;
    switch (selectedCurrency) {
      case Currency.RIELS:
        return amout * 4100;
      case Currency.EURO:
        return amout * 0.96;
      case Currency.DONG:
        return amout * 25377;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.conveyor_belt),
              const Text("Converter"),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Amount in dollars'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: amoutController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (val) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          hintText: 'Enter text'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Device'),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton<Currency>(
                      hint: const Text("Select Device"),
                      value: selectedCurrency,
                      items: Currency.values.map((currency) {
                        return DropdownMenuItem<Currency>(
                          value: currency,
                          child: Text(currency.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCurrency = newValue!;
                        });
                      },
                      isExpanded: true,
                    ),
                    const SizedBox(height: 20),
                    const Text("Amount in selectd Device :"),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        convertedCurrency().toStringAsFixed(2),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
