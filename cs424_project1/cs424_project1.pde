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
import org.gwoptics.graphics.graph3D.*;
import org.gwoptics.graphics.colourmap.*;
import org.gwoptics.graphics.graph2D.backgrounds.*;
import org.gwoptics.graphics.graph2D.traces.*;
import org.gwoptics.graphics.camera.*;
import org.gwoptics.graphics.graph2D.effects.*;
import org.gwoptics.graphics.graph2D.*;
import org.gwoptics.*;
import org.gwoptics.gaussbeams.*;
import org.gwoptics.graphicsutils.*;
import org.gwoptics.mathutils.*;
import org.gwoptics.graphics.*;
import org.gwoptics.graphics.colourmap.presets.*;
// must import java.awt.event.*
import java.awt.event.*;
import com.nootropic.processing.layers.*;
import java.text.SimpleDateFormat;
import controlP5.*;

Graph2D g;
double prevTemp = 0.0;
public boolean convertFlag = true;
PFont plotFont;
public ControlP5 controlP5;
convert converter = new convert();
public DataSet dataSet = new DataSet();
float y;
public RadioButton r;
public PImage b;
AppletLayers layers;
/**
 *  Equations that are to be plot must be encapsulated into a 
 *  class implementing the IGraph2DCallback interface.
 **/


public class eq2 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "1") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "1") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }
    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return convert(prevTemp);
    }
  }
}
public class eq3 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "2") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "2") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }


    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return convert(prevTemp);
    }
  }
}
public class eq4 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "3") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "3") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }


    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return convert(prevTemp);
    }
  }
}
public class eq5 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "4") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "4 ") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }


    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return  convert(prevTemp);
    }
  }
}
public class eq6 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "5") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "5") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }


    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return convert(prevTemp);
    }
  }
}
public class eq7 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "6") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "6") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }


    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return convert(prevTemp);
    }
  }
}
public class eq8 implements ILine2DEquation {
  public double computePoint(double x, int pos) {
    TempReading temp = (TempReading) dataSet.readingsByDate.get(pos);
    println(convert(temp.Temperature));

    if (temp.id.compareTo( "7") == 0 && convertFlag) {
      prevTemp = temp.Temperature;
      return temp.Temperature;
    }
    else if (temp.id.compareTo( "7") == 0 && !convertFlag)
    {
      prevTemp = temp.Temperature;
      return convert(temp.Temperature);
    }


    else if (convertFlag) {
      return prevTemp;
    }
    else {
      return convert(prevTemp);
    }
  }
}
//This method converts a input into celcius.
public double convert(double x) {
  return (x - 32.0) * (5.0/9.0);
}
//85,65 292, 188

void setup() {
  size(1024, 768);
  //timeline = new Timeline(this);
  frameRate(30);
  //From control p5 examples
  //noStroke();
  smooth();
  // Images must be in the "data" directory to load correctly

  controlP5 = new ControlP5(this);
  layers = new AppletLayers(this);
  r = controlP5.addRadioButton("radioButton", 1000, 600);
  r.setColorForeground(color(0));
  r.setColorActive(color(255));
  r.setColorLabel(color(255));
  r.setItemsPerRow(1);
  r.setSpacingColumn(50);
  addToRadioButton(r, "F", 1);
  addToRadioButton(r, "C", 2);
  controlP5.addButton("Advance", 0, 700, 700, 80, 19);

  converter.process();
  TempReading tempReading;
  String idTemp = "";
  Date ReadingDateTemp = new Date();
  SimpleDateFormat formatter = new SimpleDateFormat("MMM/dd/yyyy HH:mm aa");
  //converter.data.size()
  for (int counter = 0; counter < converter.data.size(); counter++) {
    String[] temp = converter.data.get(counter);
    try {
      dataSet.readingsByDate.add( new TempReading(temp[1], formatter.parse(temp[0]), Double.parseDouble(temp[2])));
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  // Creating the Graph2D object:
  // arguments are the parent object, xsize, ysize, cross axes at zero point
  g = new Graph2D(this, 600, 400, false); 

  // Defining the main properties of the X and Y-Axis
  if (!convertFlag)
  {
    g.setYAxisMin(10);
    g.setYAxisMax(40);
  }
  else
  {
    g.setYAxisMin(50);
    g.setYAxisMax(100);
  }
  g.setXAxisMin(0);
  g.setXAxisMax(100);
  g.setXAxisLabel("Years");
  g.setYAxisLabel("Temperature");
  g.setXAxisTickSpacing(10);
  g.setYAxisTickSpacing(10);

  // Offset of the top left corner of the plotting area
  // to the sketch origin (should not be zero in order to
  // see the y-axis label
  g.position.x = 200;
  g.position.y = 200;


  // Here we create a new trace and set a colour for
  // it, along with passing the equation object to it.
  Line2DTrace trace = new Line2DTrace(new eq2());
  trace.setTraceColour(255, 159, 0);

  Line2DTrace trace2 = new Line2DTrace(new eq3());
  trace2.setTraceColour(86, 180, 233);
  Line2DTrace trace3 = new Line2DTrace(new eq4());
  trace3.setTraceColour(0, 0, 0);
  Line2DTrace trace4 = new Line2DTrace(new eq5());
  trace4.setTraceColour(0, 158, 115);
  Line2DTrace trace5 = new Line2DTrace(new eq6());
  trace5.setTraceColour(240, 228, 66);
  Line2DTrace trace6 = new Line2DTrace(new eq7());
  trace6.setTraceColour(0, 114, 178);
  Line2DTrace trace7 = new Line2DTrace(new eq8());
  trace7.setTraceColour(213, 94, 0);
  // Adding the trace to the graph
  g.addTrace(trace);
  g.addTrace(trace2);
  g.addTrace(trace3);
  g.addTrace(trace4);
  g.addTrace(trace5);
  g.addTrace(trace6);
  g.addTrace(trace7);
  frame.addMouseWheelListener(new MouseWheelInput());
}
void paint(java.awt.Graphics g) {
  if (layers != null) {
    layers.paint(this);
  } 
  else {
    super.paint(g);
  }
}
public void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) {
  //From Control p5 examples
  final Toggle t = theRadioButton.addItem(theName, theValue);
  t.captionLabel().setColorBackground(color(80));
  t.captionLabel().style().movePadding(2, 0, -1, 2);
  t.captionLabel().style().moveMargin(-2, 0, 0, -3);
  t.captionLabel().style().backgroundWidth = 46;
}


void draw() {

  //You have a mouse pressed function keypressed function etc...
  background(255);

  g.draw();

  layers.addLayer(new RoomLayer(this, 0, 0));
}
public void controlEvent(ControlEvent theEvent) {
  if (theEvent.group().arrayValue() != null) {
    for (int i=0;i<theEvent.group().arrayValue().length;i++) {
      int n = (int)theEvent.group().arrayValue()[i];

      if (n==10) {
        convertFlag = false;
      }
      if (n==01) {
        convertFlag = true;
      }
    }
  }
}
// convenience class to listen for MouseWheelEvent
// modify mouseWheelMoved() for your own purposes see http://workshop.evolutionzone.com/2007/09/26/code-mousewheelpde/

class MouseWheelInput implements MouseWheelListener {

  void mouseWheelMoved(MouseWheelEvent e) {
    int step=e.getWheelRotation();
    y=y+step*5;
  }
}

