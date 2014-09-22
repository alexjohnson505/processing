Table table;

void setup(){
  size(1000, 250);
  background(0);
  smooth();
  drawboxes();
}

void drawboxes(){
  table = loadTable("random.csv", "header");
  for (TableRow row : table.rows()){
    int x = row.getInt("Number1");
    int y = row.getInt("Count");
    
    fill(255, 40);
    noStroke();
    rect(x * 8, y, 5, 5);
  }
}
