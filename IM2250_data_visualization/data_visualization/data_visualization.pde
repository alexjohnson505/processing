Table table;

void setup(){
  size(1000, 250);
  background(0);
  smooth();
  brawboxes();
}

void draw(){
  table = loadTable("random.csv", "header");
  for (TableRow row : table.rows()){
    int x = row.getInt("Number1");
    fill(255, 40);
    noStroke();
    rect(x * 10, width/5, 10, 10);
  }
}
