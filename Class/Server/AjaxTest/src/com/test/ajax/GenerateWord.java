package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GenerateWord {

	public static void main(String[] args) {
		
		String txt = "Why Use JRebel?\r\n" + 
				"Real-time change visibility\r\n" + 
				"View the results of iterative code and resource changes to a Java application in real-time. Faster is better!\r\n" + 
				"\r\n" + 
				"Maintains application state\r\n" + 
				"Avoid the time spent reproducing the pre-change application state after a redeploy. Get right back to where you started!.\r\n" + 
				"\r\n" + 
				"Finish Your Sprint Early\r\n" + 
				"JRebel increases team velocity up to 40% (backed by surveys and case studies).";
		
		txt = txt.replace(",", "").replace(".", "").replace("!", "");
		
		String[] temp = txt.split(" ");
		
		try {
		
			Connection conn = DBUtil.open();
			
			PreparedStatement stat = null;
			
			String sql = "INSERT INTO tblWord (word) VALUES (?)";
			
			for (String word : temp) {
				
				System.out.println(word);
				stat = conn.prepareStatement(sql);
				stat.setString(1, word);
				stat.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
