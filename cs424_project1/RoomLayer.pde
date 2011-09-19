class RoomLayer extends Layer {
    int x, y, size, age, c;
    int alpha = 255;
    int hue = 255;
   RoomLayer(PApplet parent, int x, int y){
      super(parent);
      this.x = x;
      this.y = y;
    }
   void setup() {
    smooth();
    colorMode(HSB);
   }
   void draw(){
     age++;
      b = loadImage("evl_2nd_floor.jpg");
  image(b, 0, 0, 805/4, 452/4);
  fill(255,0,0,127);
//  rect(30,100,200,40);
//  rect(30,50,200,40);
//  rect(70,295,125,200);
//  rect(85/4,237/4,290/4,360/4);
   }
}
