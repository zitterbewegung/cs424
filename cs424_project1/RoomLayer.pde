class RoomLayer extends Layer {
  int x, y, size, age, c;
  int alpha = 0;
  int hue = 255;
  RoomLayer(PApplet parent, int x, int y) {
    super(parent);
    this.x = x;
    this.y = y;
  }
  void setup() {
   hint(ENABLE_OPENGL_4X_SMOOTH);
    
  }
  void draw() {
    age++;
    b = loadImage("evl_2nd_floor.jpg");
   image(b, 0, 0, 805/4, 452/4);
     
    PFont font;
    
    font = loadFont("SansSerif-32.vlw");
    textFont(font);
    smooth();
    fill(255, 159, 0);
    text("Room 1" , 800,230);
    fill(86, 180, 233);
    text("Room 2" , 800,280);
    fill(0, 0, 0);
    text("Room 3" , 800,330);
    fill(0, 158, 115);
    text("Room 4" , 800,380);
    fill(240, 228, 66);
    text("Room 5" , 800,430);
    fill(0, 114, 178);
    text("Room 6" , 800,480);
    fill(213, 94, 0);
    text("Room 7" , 800,530);
    fill(0, 0, 0);
    text("Legend",800, 180);
    //  rect(30,100,200,40);
    //  rect(30,50,200,40);
    //  rect(70,295,125,200);
   fill(255, 0, 127, 20);
   rect(85/4,237/4,270/4,340/8);

   
  }
}

