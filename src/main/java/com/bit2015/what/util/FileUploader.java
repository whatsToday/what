package com.bit2015.what.util;

import java.io.FileOutputStream;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	
	private static final String SAVE_PATH = "\\\\192.168.1.9\\temp";
	
	public String upload( MultipartFile file1 ) {
		
		String url="";
		
		// 1번째 파일 저장
		if( file1.isEmpty() == false ) {
	        String fileOriginalName = file1.getOriginalFilename();
	        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
	        
	        String saveFileName = genSaveFileName( extName );
	        url = "/product-images/" + saveFileName;
	
	        writeFile( file1, SAVE_PATH, saveFileName );
		}
		
        return url;
	}
	
	private void writeFile( MultipartFile file, String path, String fileName ) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream( path + "\\" + fileName );
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}
	
	private String genSaveFileName( String extName ) {
		
        Calendar calendar = Calendar.getInstance();
		String fileName = "";
        
        fileName += calendar.get( Calendar.YEAR );
        fileName += calendar.get( Calendar.MONTH );
        fileName += calendar.get( Calendar.DATE );
        fileName += calendar.get( Calendar.HOUR );
        fileName += calendar.get( Calendar.MINUTE );
        fileName += calendar.get( Calendar.SECOND );
        fileName += calendar.get( Calendar.MILLISECOND );
        fileName += ( "." + extName );
        
        return fileName;
	}
}
