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







public class Pair2gexf {

	 /**
	  * @param args the command line arguments
	  * @throws IOException 
	  */
	
	public static void main(String[] args) {
    	
        String description = "";
    	//Arg 0 input filename, arg 1 output filename, arg 2 creator, arg 3 timeformat, arg 4 seperator arg[s] 5 ... description,
    	if(args.length  < 5){
    		System.out.println(" Usage: pair2gexf pairfile output creator timeformat seperator description");
    		System.exit(0);
    	}
     	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	
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
         for (int i = 5; i < args.length; ++i) {
			description += args[i];
		}
		gexf.getMetadata().setLastModified(calendar.getTime())
             .setCreator(args[2])
             .setDescription(description);
        gexf.getGraph().setMode(Mode.DYNAMIC);
      
         //Creation of the graph object
       
     	try {
    		
			//Use the first argument as the input to file reader
			FileReader input = new FileReader(args[0]); 
			//Create a buffered reader and allow for read in the file
			BufferedReader buffer = new BufferedReader(input); 
			
			String line;
			//This reads in a file line by line and puts it into a large string
			while((line = buffer.readLine()) != null){
				 line.replace('	', ' ');
				 String splitstring [] = line.split("\\s"); 
		         String pairdate = splitstring[0].split("T")[0];
		  
		         //Creates the first node in the pair
		        
		        
		        
		         //TODO For just nodes create just the node without edge?
		       	 if(!doubleflag){
		         node1.setStartDate(formatter.parse(pairdate));
		       	 }
		       	 else{
		       		 node1.setStartDatedouble(nodedate);
		       	 }
		         if(splitstring.length > 2){
		        	 Node node2 = gexf.getGraph().createNode(splitstring[2]);
		        	 node2.setLabel(splitstring[1]);
		        	 //Creates the second node in the pair
		        	 if(doubleflag){
		        		 //TODO set date specification as double.
		        		 gexf.getGraph().setTimeType(TimeType.FLOAT);
			        	
			        	 node1.setEndDatedouble(nodedate);
				        	 node1.setStartDatedouble(nodedate);
				        	 node2.setStartDatedouble(nodedate);
					         node1.setEndDatedouble(nodedate);
					         node2.setEndDatedouble(nodedate);
					         //Set the start and end dates of the graph
					         node1.connectTo(node2).setStartDatedouble(nodedate).setEndDatedouble(nodedate);
					      
			        	 
			         }
		        	 else{
		        
		        	 Date nodedate1 = formatter.parse(splitstring[0]);
		        	 
		        	 node1.setEndDate(nodedate1);
		        	 node1.setStartDate(nodedate1);
		        	 node2.setStartDate(nodedate1);
			         node2.setEndDate(nodedate1);
			         //Set the start and end dates of the graph
			         node1.connectTo(node2).setStartDate(nodedate1).setEndDate(nodedate1);
		        	 }
			   
		         }
		         if (splitstring.length == 3) {
		        	 System.out.println("Edge created" + " " + splitstring[1]+ " " + splitstring[2] + " " + pairdate);

				}
		         else{
		        	 System.out.println("Edge created" + splitstring[1] + pairdate);
		         }
		         
			}
		//System.out.println(readIn); //Used for debugging purposes
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Ranking File Not found");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("IO exception");
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println("Parse exception");
			e.printStackTrace();
		}
        
        //Create the graph writer and output the graph.
		StaxGraphWriter gw = new StaxGraphWriter();
		File f = new File(args[1]);
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(f);
			// write the file and close the stream - no XML worries!
			gw.writeToStream(gexf, fos);
			fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	 }
