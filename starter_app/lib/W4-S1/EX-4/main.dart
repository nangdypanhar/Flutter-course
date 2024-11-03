import 'package:flutter/material.dart';

Map<String, String> imagesLink = {
  "sunny":
      "https://static.vecteezy.com/system/resources/thumbnails/010/989/531/small_2x/hot-weather-3d-rendering-isolated-on-transparent-background-ui-ux-icon-design-web-and-app-trend-png.png",
  "cloudy":
      "https://cdn3d.iconscout.com/3d/premium/thumb/weather-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--cloud-forecast-nature-sun-cloudy-user-interface-pack-illustrations-2725115.png",
  "rainy":
      "https://static.vecteezy.com/system/resources/thumbnails/011/992/945/small/thunderstorm-rain-icon-weather-forecast-meteorological-sign-3d-render-png.png",
  "snowy":
      "https://static.vecteezy.com/system/resources/thumbnails/012/806/416/small_2x/3d-cartoon-weather-icon-snow-clouds-and-snowflakes-sign-isolated-on-transparent-background-3d-render-illustration-png.png",
  "windy":
      "https://static.vecteezy.com/system/resources/thumbnails/043/204/525/small_2x/weather-and-season-3d-icon-png.png"
};

enum WeatherCondition {
  sunny("sunny"),
  rainy("rainy"),
  snowy("snowy"),
  cloudy("cloud"),
  windy("windy");

  final String label;

  const WeatherCondition(this.label);
  @override
  String toString() => label;
}

enum Day {
  monday("Monday"),
  tuesday("Tuesday"),
  wednesday("Wednesday"),
  thursday("Thursday"),
  friday("Friday"),
  saturday("Saturday"),
  sunday("Sunday");

  final String label;

  const Day(this.label);
  @override
  String toString() => label;
}

class Weather {
  final String day;
  final WeatherCondition condition;
  final int temperature;

  Weather({
    required this.day,
    required this.condition,
    required this.temperature,
  });
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  String getImageUrl(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.sunny:
        return imagesLink["sunny"]!;
      case WeatherCondition.rainy:
        return imagesLink["rainy"]!;
      case WeatherCondition.snowy:
        return imagesLink["snowy"]!;
      case WeatherCondition.cloudy:
        return imagesLink["cloudy"]!;
      case WeatherCondition.windy:
        return imagesLink["windy"]!;
      default:
        return imagesLink["sunny"]!;
    }
  }

  const WeatherCard({
    required this.weather,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(weather.day),
            Image.network(
              getImageUrl(weather.condition),
              height: 100,
            ),
            Text("${weather.temperature} °C"),
          ],
        ),
      ),
    );
  }
}

final List<Weather> weatherList = [
  Weather(day: 'Monday', condition: WeatherCondition.sunny, temperature: 25),
  Weather(day: 'Tuesday', condition: WeatherCondition.rainy, temperature: 18),
  Weather(day: 'Wednesday', condition: WeatherCondition.snowy, temperature: -2),
  Weather(day: 'Thursday', condition: WeatherCondition.cloudy, temperature: 20),
  Weather(day: 'Friday', condition: WeatherCondition.windy, temperature: 30),
];

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather Forecast"),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            final weather = weatherList[index];
            return WeatherCard(weather: weather);
          },
        ),
      ),
    ),
  );
}
