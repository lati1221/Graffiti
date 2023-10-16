package com.grafitti.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\user\\Downloads\\lombok\\upload\\memo";
	
	
public static String saveFile(int userId, MultipartFile file) {
		
		if(file == null) {
			return null;
		}
		
		
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		
		
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			
			return null;
		}
		
		
		String filePath = directoryPath + "/" + file.getOriginalFilename();
		
		try {
			byte[] bytes = file.getBytes();
			
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
	
			return null;
		}
		
		
		
		return "/images" + directoryName + "/" + file.getOriginalFilename();
		
	}
	
	
	public static boolean removeFile(String filePath) {  ///images/2_9140918290/test.png
		
		if(filePath == null) {
			return false;
		}
		
		 
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		
		Path path = Paths.get(fullFilePath);
		
		
		if(Files.exists(path)) {
			
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		Path dirPath = path.getParent();
		
		
		if(Files.exists(dirPath)) {
			
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return false;
			}
		}
		
		return true;
		
		
	}
}
