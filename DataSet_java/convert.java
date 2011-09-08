import processing.core.PApplet;

//Released under the Apache licence
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;


public class Convert {

	 /**
	  * @param args the command line arguments
	  * @throws IOException 
	  */
	
	public static void main(String[] args) throws FileNotFoundException, IOException {

//example string May/04/2008 10:00 PM FF00080057FB1810  67
    	//Arg 0 input filename, arg 1 output filename, arg 2 creator, arg 3 timeformat, arg 4 seperator arg[s] 5 ... description,
    	if(args.length  < 5){
    		System.out.println(" Usage: pair2gexf pairfile output creator timeformat seperator description");
    		System.exit(0);
    	}
     	SimpleDateFormat formatter = new SimpleDateFormat("MMM/dd/yyyy HH:mm aa" );
    	
    	boolean doubleflag = false;
    	if(!(args[3].compareTo("double") == 0))
    	{
    		formatter = new SimpleDateFormat(args[3]);
    	}
    	else{
    		doubleflag = true;
    	}
    	
   
    	
    	//Calendar object to get the current time.
         Calendar calendar = Calendar.getInstance();
      
         //Creation of the graph object
       
     	
    		
			//Use the first argument as the input to file reader
			FileReader input = new FileReader("history.txt"); 
			//Create a buffered reader and allow for read in the file
			BufferedReader buffer = new BufferedReader(input); 
			TempReading readings = new TempReading();
			String line;
			//This reads in a file line by line and puts it into a large string
			while((line = buffer.readLine()) != null){
				 line.replace('	', ' ');
				 String splitstring [] = line.split(",");
                                
		  
		         //Creates the first node in the pair
		        
		        
		        }
		
	}
}

