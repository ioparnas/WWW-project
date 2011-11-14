package model;

import java.*;
import java.io.*;
import java.net.*;
import com.google.gson.*;

public class CurExpert{
	public String getMoney(String From, String To, String Money) {
		if (From.equals(To))  return("No convertion needed.<br>You already have "+To );
		if (Money.length()>12) return("Input is too long... <br>I m not paid enough for this!");
		try{
			if(Double.parseDouble(Money)<0) 
				return(api(From,To,Money)+"<br>Your money are subzer0! fail.");
			else
				return(api(From,To,Money));
		}
		catch(Exception error){
			return("Type a number plz");
		}
		
	}
	public String api(String From, String To, String Money) {
		String json = "";
		try {
			URL con = new URL("http://www.google.com/ig/calculator?hl=en&q="+Money+From+"=?"+To);
			BufferedReader in = new BufferedReader(new InputStreamReader(con.openStream()));
			json = in.readLine();
			in.close();
 			Data data = new Gson().fromJson(json, Data.class);
			return(""+data);
		}
			catch (Exception mue) {
		}
		return("Something went really wrong  :( ");
	}
	class Data {
    		private String lhs;
    		private String rhs;
    		private String error;
    		private Boolean icc;

   		public String toString() {
        		return(rhs);
    	
		}
	}
}