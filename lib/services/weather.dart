import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const  APIkey = '8c6e24ad4e84405942c1d8aaae85bdb8';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> GetWeatherByCityName(String cityName) async{
    NetworkHelper networkHelper = await NetworkHelper('$openWeatherMap?q=$cityName&appid=$APIkey&units=metric');
    var weatherdata = networkHelper.getData();
    return weatherdata;
  }
  Future<dynamic> getlocationweather() async{
    Location fromloctation = Location();
    await fromloctation.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMap?lat=${fromloctation.latituade}&lon=${fromloctation.longituade}&appid=$APIkey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
