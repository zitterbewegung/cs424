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
import processing.core.PApplet;

import java.util.ArrayList;

public class convert {

	/**
	 * @param args
	 *            the command line arguments
	 * @throws IOException
	 */
	public ArrayList<String[]> data = new ArrayList<String[]>();
	public String columns;

	public ArrayList<String[]> getData() {
		return data;
	}

	public void setData(ArrayList<String[]> x) {
		data = x;
	}

	public static void main(String[] args) {

		convert converter = new convert();
		converter.process();

	}

	public void process() {
		try {

			// Use the first argument as the input to file reader
			FileReader input = new FileReader(
					"/Users/zitterbewegung/Documents/cs424/cs424_project1/data/history.csv");
			// Create a buffered reader and allow for read in the file
			BufferedReader buffer = new BufferedReader(input);
			// parent.readings;

			columns = buffer.readLine();
			String line;
			// This reads in a file line by line and puts it into a large string
			while ((line = buffer.readLine()) != null) {
				String splitstring[] = line.split(",");
				// example string May/04/2008 10:00 PM FF00080057FB1810 67
				data.add(splitstring);
				// data.add(formatter.parse(splitstring[0]));
				// data.add(splitstring[1]);
				// data.add(splitstring[2]);

				// Creates the first node in the pair

			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
