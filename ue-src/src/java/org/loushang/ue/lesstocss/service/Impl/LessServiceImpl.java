package org.loushang.ue.lesstocss.service.Impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.loushang.ue.lesstocss.service.ILessService;
import org.springframework.stereotype.Service;

@Service("LessService")
public class LessServiceImpl implements ILessService{
	
	@SuppressWarnings("resource")
	@Override
	public void createCss(String content) {
		String context = "F:\\Workspaces\\ue\\test.css";
		File file = new File(context);
		if (!file.getParentFile().exists()) 
		{
			file.getParentFile().mkdirs();
		}
		else {
			
		}
		try 
		{
			file.createNewFile();
		} catch (IOException e) 
		{
			e.printStackTrace();
		}
		try 
		{
			FileWriter fw = new FileWriter(file, false);
			content = content.replaceAll("＃","#").replaceAll("＄","$").replaceAll("％","%").replaceAll("＆","&").replaceAll("　"," ").replaceAll ("<br>", "\r\n");
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write("");
			bw.write(content);
			bw.flush();
			bw.close();
			fw.close();
		} catch (IOException e) 
		{
			e.printStackTrace();
		}
		try 
		{
			FileReader fr = new FileReader(file);
			new BufferedReader(fr);
		} catch (FileNotFoundException e) 
		{
			e.printStackTrace();
		}	
	}
}