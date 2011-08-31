/*Project 1 due 3 weeks from yesterday.
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

Ways we can attack this

desire to show all of the data? Be careful of that.
Make sure that your sketch is a nice interactive view of the data

Getting it to work is the prerequisite to do something interesting. 
Get it to work halfway through the project time

Task 1 Document the repeating seasonal patterns
task 2 GIven the results from task 1 document the long term trends
task 3 given the results from task 2 what are the events that have the largest affect of the data
task 4 predict the average room temperature in each evl room for october 2011 and November 2011
Main type of colorblindness. To avoid this don't use green

autocomplete menu
mousewheel to zoom in
scroll to scroll through timeline
absolute vs relative values
genre that someone worked in

default color scheme is horrific.
the trick is using it well


TODO SET OF WEBSITES
TODO PICTURE OF visualization
TODO 
This is going to run in the browser for now.
figure 01 just points.
If you close a shape you can specifiy a color.
*/
import controlP5.*;
Convert converter;


void setup(){
  size(1024,768);
  frameRate(30);
  controlP5 = new ControlP5(this);
}
void draw(){
  
  //You have a mouse pressed function keypressed function etc...
  
}
void mouseDragged(){
  x = mouseX; //Variables which have mouse x and y
  y = mouseY; 
}

