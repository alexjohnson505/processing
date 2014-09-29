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

int windowWidth = 850;
int windowHeight = 450;

// Setup Data
void setup() {
  
  // GET data from API
  fetchData();
  
  // Init window
  size(windowWidth, windowHeight);
  
  // Light blue background
  background(240, 240, 255, .1);
  
  // Render graph once
  render();
};

// Render once
void render () {
  
  // Provide KEY for graph
  fill(124, 176, 204);
  text("Humidity", 10, 20);
  
  fill(78, 110, 127);
  text("Pressure", 10, 40);
  
  fill(40, 96, 127);
  text("Temperature", 10, 60);
  
  // Iterate through objects
  for (int i = 0; i < data.size(); i++) {
    
    // Extract moment
    JSONObject moment = data.getJSONObject(i);
    JSONObject wind = moment.getJSONObject("wind");
    
    println(moment);
    
    // Extract data units
    float humidity = moment.getFloat("humidity");
    float temperature = convertToF(moment.getFloat("temp"));
    float windSpeed = wind.getFloat("speed");
    
    // 78, 110, 127 | 79, 192, 255 | 156, 220, 255 | 40, 96, 127 | 124, 176, 204
    
    noStroke();
  
    // Each day is 30px apart)
    pushMatrix();
      translate(i * 30, 450);
      
      // Humidity
      renderBar(humidity, 0, color(124, 176, 204));
    
      // Render temperature bars
      renderBar(temperature * 5, 15, color(40, 96, 127));
      
      // Wind Speed
      renderLine();
      
     popMatrix();
     
  }
};

// Render a point in a line plot.
void renderLine(){
}

// Render a single bar in a line chart, given:
//   (float) value = numeric value to render
//   (int) xOffset = horizontal offset (x location to begin)
//   (color) c = fill color

void renderBar(float value, int xOffset, color c){
  
  // Render bar
  fill(c);
  rect((float)xOffset, (float)0, 10, value * -1);
  
  // Print value
  fill(0, 0, 0);
  text((int)value, xOffset - 5, value * -1 - 8);
  
//  color, xOffset, value;
}

void draw() {
}

// Convert float from Kelvin to Fehrenheit
float convertToF(float i){
  float x = (9 / 5) * (i - 273) + 32;
  println(x); 
  return  x;
}

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
