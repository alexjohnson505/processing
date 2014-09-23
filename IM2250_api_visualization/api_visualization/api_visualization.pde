//written by Richard Phung for NEU-2250-Intro to Programming
//Example3:  Parsing XML Data from LastFM

/*Concept--- A very simple program that fetches information in the fomr of an XML file and 
grabs certain elements from the data.  In this example, I'm grabbing the album cover data from
my user feed which shows the last x# of tracks that I listened to.
*/

    int maxw = 800;
    int maxh = 400;
    String username = "p3hndrx";
    String keystring = "9f3e514c4b35f2e0fbe7bc43a56b61b6";
    //String secret = "3618100926ba40711d2bef7386bce4f5";
    int limit = 100;
    
//GET XML DATA
    String lastfm = new String ("http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user="+ username + "&api_key=" + keystring + "&limit=" + limit);
    XML fmdata = loadXML(lastfm);
    
    XML lovedtracks = fmdata.getChild("lovedtracks");  //start storing values
    XML[] tracks = lovedtracks.getChildren("track");   //get child items
    
    String[] covers = new String[tracks.length];       //arrays that will store our images
    PImage[] img = new PImage[tracks.length];

void setup() {
  size(maxw,maxh);
  background(128,128,128);
  smooth();
  noLoop();
    
    println("API returned.... " + tracks.length +".  \nYou must LOVE your music.");  //friendly message
    
    //here, we start going through them.
      for(int i = 0; i < tracks.length; i++)  {  
          XML[] images = tracks[i].getChildren("image");  //grab the image element
              for(int j = 0; j < images.length; j++)  {
                    if(images[j].getString("size").equals("large"))   //get the large version of the element
                    {
                   String poster = images[j].getContent();
                   println(poster);
                   covers[i] = poster;   //store the urls as an array
                  }              
                
              }
          }
          println("there are " + covers.length + " total posters");
          
                 
          for(int i = 0; i < tracks.length; i++)   {
              if(!(covers[i] == null))  {    //check to see if it's blank  *some don't have album covers
              String coverurl = covers[i];
              
              println("creating--- " + coverurl);
              img[i] = loadImage(coverurl);  //otherwise, use the returned image
              } else  {
              println("creating--- placeholder");
              img[i] = loadImage("http://www.imagemagick.org/Usage/masking/alpha_transparent.png");
              }
  
          }
      
};


void draw() {
      for(int i = 0; i < tracks.length; i++)  {
      float dim = random(64,128);
      image(img[i], random(0,width-64), random(0,height-64), dim,dim);
      }    
      
};

void mousePressed() {
  background(128,128,128);
  redraw();
}
