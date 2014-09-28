// Alex Johnson
// IM 2250 Programming for Digital Media
// Assignment 03 - Data/API Exploration.

/********************************************
  Visualize historical data from a specific 
  weather station. Render a graph based on
  hourly weather metrics.
  
  Thanks to OpenWeatherMap.org and their public API 
  of historical and prediction weather data.
  
  Thanks to Richard Phung for his in-class demo.
 ********************************************/ 

// Example URL:
// http://api.openweathermap.org/data/2.5/history/station?id=5091&type=tick

// API URL
String baseURL = "http://api.openweathermap.org/data/2.5/";
String stationID = "5091";

// Init JSON object
JSONObject openWeatherMapData;
JSONArray data;

int windowWidth = 800;
int windowHeight = 600;

// Setup Data
void setup() {
  fetchData();
  size(windowWidth, windowHeight);  
};

void draw() {
  for (int i = 0; i < data.size(); i++) {
    println("*******************************");
    println(data.getJSONObject(i));
  }
  
//   for (int i = 0; i < data.size(); i++) {
//    JSONArray day = data.getJSONObject(i);
////    float temp = day.temp; 
//    
//    println("*******************************");
//    println(temp);
//    
//    
//  }

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
  
  // Parse JSON object into usable array
  data = openWeatherMapData.getJSONArray("list");
  
  // Print results to console
  // println(openWeatherMapData); 
}
