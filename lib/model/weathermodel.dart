class Weather {
  final double lon;
  final double lat;
  final String main;
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final String country;
  final String name;

  Weather({
    required this.lon,
    required this.lat,
    required this.main,
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.country,
    required this.name,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lon: json['coord']['lon'],
      lat: json['coord']['lat'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      windDeg: json['wind']['deg'],
      country: json['sys']['country'],
      name: json['name'],
    );
  }
}