// Alex Johnson
// IM 2250 Programming for Digital Media
// Assignment 03 - Data/API Exploration.

/* 
  Goal: Visualize a remote data set.
  Thanks to OpenWeatherMap.org and their public API 
  of historical and prediction weather data
  Thanks to Richard Phung for his in-class demo.
 */ 

// Example URL:
// http://api.openweathermap.org/data/2.5/history/station?id=5091&type=tick
String baseURL = "http://api.openweathermap.org/data/2.5/";
String stationID = "5091";

// Init JSON object
JSONObject openWeatherMapData;

// Setup Data
void setup() {
  fetchData();
};

void draw() {
  
};

// Get data from API
void fetchData(){
  
  // Create URL to request
  String request = baseURL + "history/station?id=" + stationID + "&type=tick";
  
  // Debug info
  println("API (GET): " + request);
  
  // Combine array of strings
  String result = join(loadStrings(request), "");
 
  // Parse String into usable JSON object
  openWeatherMapData = JSONObject.parse(result);
  
  // Print results to console
  println(openWeatherMapData); 
}
