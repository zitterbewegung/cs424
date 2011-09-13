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

import timeline.*;

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

*/

import controlP5.*;


ControlP5 controlP5;
convert converter = new convert();
public DataSet dataSet;
TempReading tempReading;
Timeline timeline; 


void setup(){
  size(1024,768);
  //timeline = new Timeline(this);
  frameRate(30);
  //controlP5 = new ControlP5(this);
  converter.process();
 println( converter.getData().toString());
  
}
void draw(){
  
  //You have a mouse pressed function keypressed function etc...
  
}



