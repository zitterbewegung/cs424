class RoomLayer extends Layer {
    int x, y, size, age, c;
   RoomLayer(PApplet parent){
      super(parent);
    }
   void setup() {
    smooth();
    colorMode(HSB);
   }
   void draw(){
     age++;
      b = loadImage("evl_2nd_floor.jpg");
  image(b, 0, 0, width/4, height/4);
  fill(255,0,0,127);
  rect(30,100,200,40);
  rect(30,50,200,40);
   }
}
