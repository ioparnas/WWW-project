package model;

import java.*;
import java.io.*;
import java.net.*;
import java.math.*;

public class CurExpert{
	public String getMoney(String From, String To, String Money) {
		if (From.equals(To))  return("No convertion needed." );
		if (Money.length()>18) return("Input is too long... <br>I m not paid enough for this!");
		double m = 0.0;
		try{
			m = Double.parseDouble(Money);
		}
		catch(Exception error){
			return("Type a number plz");
		}
		if(m<0) 
			return(result(api(From,To),m)+"<br>Your money are subzer0! fail.");
		else
			return(result(api(From,To),m));
	}
	public String api(String From, String To) {
		String json = "";
		try {
			URL con = new URL("http://www.google.com/ig/calculator?hl=en&q=1"+From+"=?"+To);
			BufferedReader in = new BufferedReader(new InputStreamReader(con.openStream()));
			json = in.readLine();
			in.close();
		}
		catch (Exception mue) {
			return("Something went really wrong  :( ");
		}
		return(json);
	}

	public String result(String s, double m) {
		int start1 = 0; 
		int end1 = 0; 
		int start2 = 0; 
		int end2 = 0; 
		int counter =0;
 		for(int i=0; i<s.length(); i++){
			if (s.charAt(i)=='"') counter++;
			if ((end2==0)&&(start2!=0)&&(s.charAt(i)=='"')) end2=i;
			if ((counter>2)&&(end1==0)&&(start1!=0)&&(s.charAt(i)==' '))	{end1=i; start2=i+1;}
			if ((counter>2)&&(start1==0)&&(s.charAt(i)=='"'))	start1=i+1;
		}
		char buf1[] = new char[end1 - start1];
		char buf2[] = new char[end2 - start2];
		s.getChars(start1, end1, buf1, 0); 
		s.getChars(start2, end2, buf2, 0); 
		double result = (Double.parseDouble(new String(buf1)))*m;
		long cash = (long) result;
		int change = (int)((result - (double)cash)*1000);
		return(cash +"."+change+"  "+new String(buf2)); 	
	}
}
