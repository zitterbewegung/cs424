
/*
* Project 1 due 3 weeks from yesterday.
This must be an interactive application that shows the data.

Elegance vs working. Hacks or solutions that finish work better. Good balance between working and elegance.
/Main idea is getting everyone playing with processing. Getting to the group projects with 2 3 and 4 so if you start specializing you have common ground. you know how to talk with people. 
This also gets you to writing a graph class that you have to reuse. We have been collecting temperature data as a internal weather map.

One of the issues is its hot in the winter and cold in the summer. Using a 1 wire system. We have a really big text file
you get a key

Data is mostly correct current data set is windows xp. Some holes and multiple errors ? (Create a set class)

Plot the datapoints initially to get minimum maximum etc.. to get a sense of the file.
format is same throughout
idea is to show the trends and patterns in the dataset

* Ways we can attack this

desire to show all of the data? Be careful of that.
Make sure that your sketch is a nice interactive view of the data

Getting it to work is the prerequisite to do something interesting. 
Get it to work halfway through the project time

* Task 1 Document the repeating seasonal patterns

* task 2 GIven the results from task 1 document the long term trends
task 3 given the results from task 2 what are the events that have the largest affect of the data
task 4 predict the average room temperature in each evl room for october 2011 and November 2011
Main type of colorblindness. To avoid this don't use green

* TODO autocomplete menu
* TODO mousewheel to zoom in
* TODO scroll to scroll through timeline
* TODO absolute vs relative values
* TODO include justification of why you make decisions
genre that someone worked in

default color scheme is horrific.
the trick is using it well


* TODO SET OF WEBSITES
* TODO PICTURE OF visualization
* TODO Turn in project
* This is going to run in the browser for now.
** figure 01 just points.
** If you close a shape you can specifiy a color.
* Draw the application before you try to do it.
* Making it easy for people to run your app is appreciated.
* DRY do not repeat yourself.
* See the same data in multiple ways. Multiple views keep each
* Put more information on display
* TODO design in grayscale and then scale up
* What colors mean
* Colors can speed recognition
** Be mindful of your blindspot and what 			      :NOTES:
** Some colors don't belong with each other(Bright red bright blue)   :NOTES:
* Fewer colors is generally better :NOTES:
* TODO Who, what where for your data and your visualization and what is important. Also giving context. Context for your data is extremely important
** You can play with data sources too 				      :NOTES:

* For basic tables and graphic code you should look at what other people do and then adapt them to what you want.
** Overlapping months on top of each other 			      :NOTES:
*Sheets
**Blue sheet I can't hear you
**Green Sheet 1 minute left in presentation
**Red sheet hit 4 minutes (Stop presentation immediately)
*Spend time showing your app :PRESENTATION:
*Put website on multiple places (thumbdrive) :PRESENTATION:
*/
import com.nootropic.processing.layers.*;

import java.text.SimpleDateFormat;
import controlP5.*;

//Begin code from step_17_interpolate
FloatTable data;
float dataMin, dataMax;

float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;

int rowCount;
int columnCount;
int currentColumn = 0;

int yearMin, yearMax;
int[] years;

int yearInterval = 10;
int volumeInterval = 10;
int volumeIntervalMinor = 5;

float[] tabLeft, tabRight;
float tabTop, tabBottom;
float tabPad = 10;

Integrator[] interpolators;

PFont plotFont;

ControlP5 controlP5;
convert converter = new convert();
public DataSet dataSet = new DataSet();



int myColorBackground = color(0,0,0);

RadioButton r;
PImage b;
AppletLayers layers;
void setup(){
  size(1024,768);
  //timeline = new Timeline(this);
  frameRate(30);
  //From control p5 examples
  noStroke();
  
  // Images must be in the "data" directory to load correctly

  controlP5 = new ControlP5(this);
  layers = new AppletLayers(this);
   r = controlP5.addRadioButton("radioButton",20,300);
  r.setColorForeground(color(120));
  r.setColorActive(color(255));
  r.setColorLabel(color(255));
  r.setItemsPerRow(5);
  r.setSpacingColumn(50);
   addToRadioButton(r,"F",1);
  addToRadioButton(r,"C",2);
  
  converter.process();
  TempReading tempReading;
   String idTemp = "";
   Date ReadingDateTemp = new Date();
  SimpleDateFormat formatter = new SimpleDateFormat(
					"MMM/dd/yyyy HH:mm aa");
  for(int counter = 0; counter < converter.data.size(); counter++){
    String[] temp = converter.data.get(counter);
    try{
    dataSet.readingsByDate.add( new TempReading( temp[1],formatter.parse(temp[0]), Double.parseDouble(temp[2])));
    }
    catch (Exception e) {
			e.printStackTrace();
		}
         
  }
 println( converter.getData().toString());
 println(dataSet.readingsByDate.size());
 //Begin 
  data = new FloatTable("milk-tea-coffee.tsv");
  
  String [] rows = new String[8];
  
  data = new FloatTable(rows,split(converter.columns, ","));
 for (int i = dataSet.readingsByDate.size()-1; i >= 0; i--) {
    float tempFloat[] = new float[8];
    
    TempReading element = (TempReading) dataSet.readingsByDate.get(i);
    int id = Integer.decode(element.id);
    tempFloat[id] = new Float(element.Temperature);
   data.addRow(element.id, tempFloat); 
  }
  rowCount = data.getRowCount();
  columnCount = data.getColumnCount();
  
  years = int(data.getRowNames());
  yearMin = years[0];
  yearMax = years[years.length - 1];
  
  dataMin = 0;
  dataMax = ceil(data.getTableMax() / volumeInterval) * volumeInterval;

  interpolators = new Integrator[rowCount];
  for (int row = 0; row < rowCount; row++) {
    float initialValue = data.getFloat(row, 0);
    interpolators[row] = new Integrator(initialValue);
    interpolators[row].attraction = 0.1;  // Set lower than the default
  }

  plotX1 = 60; 
  plotX2 = (width - 80)  ;
  labelX = 25;
  plotY1 = 30;
  plotY2 = (height - 70)  ;
  labelY = (height - 25)  ;
  
  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);

  smooth();
  b = loadImage("evl_2nd_floor.jpg");
  image(b, 0, 0, width/4, height/4);
  fill(255,0,0,127);
  rect(30,100,200,40);
  rect(30,50,200,40);
 
}
void paint(java.awt.Graphics g) {
  if (layers != null) {
    layers.paint(this);
  } 
  else {
    super.paint(g);
  }
}
void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) {
  //From Control p5 examples
  Toggle t = theRadioButton.addItem(theName,theValue);
  t.captionLabel().setColorBackground(color(80));
  t.captionLabel().style().movePadding(2,0,-1,2);
  t.captionLabel().style().moveMargin(-2,0,0,-3);
  t.captionLabel().style().backgroundWidth = 46;
}


void draw(){
  
  //You have a mouse pressed function keypressed function etc...
    background(224);
  
  // Show the plot area as a white box  
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1, plotY1, plotX2, plotY2);

  drawTitleTabs();
  drawAxisLabels();

   for (int row = 0; row < rowCount; row++) {
    interpolators[row].update();
  }

  drawYearLabels();
  drawVolumeLabels();

  noStroke();
  fill(#5679C1);
  drawDataArea(currentColumn);
}


void drawTitleTabs() {
  rectMode(CORNERS);
  noStroke();
  textSize(20);
  textAlign(LEFT);

  // On first use of this method, allocate space for an array
  // to store the values for the left and right edges of the tabs
  if (tabLeft == null) {
    tabLeft = new float[columnCount];
    tabRight = new float[columnCount];
  }
  
  float runningX = plotX1; 
  tabTop = plotY1 - textAscent() - 15;
  tabBottom = plotY1;
  
  for (int col = 0; col < columnCount; col++) {
    String title = data.getColumnName(col);
    tabLeft[col] = runningX; 
    float titleWidth = textWidth(title);
    tabRight[col] = tabLeft[col] + tabPad + titleWidth + tabPad;
    
    // If the current tab, set its background white, otherwise use pale gray
    fill(col == currentColumn ? 255 : 224);
    rect(tabLeft[col], tabTop, tabRight[col], tabBottom);
    
    // If the current tab, use black for the text, otherwise use dark gray
    fill(col == currentColumn ? 0 : 64);
    text(title, runningX + tabPad, plotY1 - 10);
    
    runningX = tabRight[col];
  }
}


void mousePressed() {
  if (mouseY > tabTop && mouseY < tabBottom) {
    for (int col = 0; col < columnCount; col++) {
      if (mouseX > tabLeft[col] && mouseX < tabRight[col]) {
        setCurrent(col);
      }
    }
  }
}


void setCurrent(int col) {
  currentColumn = col;
  
  for (int row = 0; row < rowCount; row++) {
    interpolators[row].target(data.getFloat(row, col));
  }
}


void drawAxisLabels() {
  fill(0);
  textSize(13);
  textLeading(15);
  
  textAlign(CENTER, CENTER);
  text("Gallons\nconsumed\nper capita", labelX, (plotY1+plotY2)/2);
  textAlign(CENTER);
  text("Year", (plotX1+plotX2)/2, labelY);
}


void drawYearLabels() {
  fill(0);
  textSize(10);
  textAlign(CENTER);
  
  // Use thin, gray lines to draw the grid
  stroke(224);
  strokeWeight(1);
  
  for (int row = 0; row < rowCount; row++) {
    if (years[row] % yearInterval == 0) {
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
      text(years[row], x, plotY2 + textAscent() + 10);
      line(x, plotY1, x, plotY2);
    }
  }
}


void drawVolumeLabels() {
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  
  stroke(128);
  strokeWeight(1);

  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
    if (v % volumeIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % volumeInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        if (v == dataMin) {
          textOffset = 0;                   // Align by the bottom
        } else if (v == dataMax) {
          textOffset = textAscent();        // Align by the top
        }
        text(floor(v), plotX1 - 10, y + textOffset);
        line(plotX1 - 4, y, plotX1, y);     // Draw major tick
      } else {
        //line(plotX1 - 2, y, plotX1, y);   // Draw minor tick
      }
    }
  }
}


void drawDataArea(int col) {
  beginShape();
  for (int row = 0; row < rowCount; row++) {
    if (data.isValid(row, col)) {
      float value = interpolators[row].value;
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      vertex(x, y);
    }
  }
  vertex(plotX2, plotY2);
  vertex(plotX1, plotY2);
  endShape(CLOSE);
}
void controlEvent(ControlEvent theEvent) {
  print("got an event from "+theEvent.group().name()+"\t");
  for(int i=0;i<theEvent.group().arrayValue().length;i++) {
    print(int(theEvent.group().arrayValue()[i]));
  }
  println("\t "+theEvent.group().value());
  myColorBackground = color(int(theEvent.group().value()*50),0,0);
}




