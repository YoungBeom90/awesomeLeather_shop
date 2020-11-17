package com.awesomeLeather.common.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	public static String mainImageUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload 호출성공.");
		
		String fileFullNames = null;
		String org_name = file.getOriginalFilename();
		log.info("org_name : " + org_name );
		
		if(org_name != null && (!org_name.equals(""))) {
			fileFullNames = fileName + "_" + UUID.randomUUID().toString().replaceAll("-", "");
			
			String rootDir = "C://uploadStorage//" + fileName;
			makeDir(rootDir);
			
			File target = new File(rootDir+ "/" + fileFullNames);
			log.info("업로드할 파일(fileAdd) : " + target);
			
			file.transferTo(target);
		}
		return "/uploadStorage/mainImages/"+ fileFullNames;
	}
	
	//다중 파일 업로드 시
	public static List<String> subImagesUpload(List<MultipartFile> files, String directory) throws IOException {
		log.info("fileUpload 호출 성공.");
		
		List<String> fileFullNames = new ArrayList<String>();
		
		if(!files.isEmpty()) {
			
			String 	name 	= "";
			String 	rootDir = "C://uploadStorage//" + directory;
			File 	target 	= null;
			
			makeDir(rootDir);
			
			for(MultipartFile multiFile : files) {
				
				name 	= directory + "_" + UUID.randomUUID().toString().replaceAll("-", "");
				target 	= new File(rootDir + "/" + name);
				
				log.info("업로드할 파일 : " + target);
				
				multiFile.transferTo(target);
				fileFullNames.add("/uploadStorage/subImages/"+ name);	
			}
		}
		
		return fileFullNames;
	}
	
	// 파일 삭제 시
	public static void fileDelete(String fileName) throws IOException {
		log.info("fileDelete 호출 성공");
		boolean result = false;
		String startDirName= "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//" + startDirName +"//" + dirName;
		} else {
			docRoot = "C://uploadStorage//" + dirName;
		}
		
		File fileDelete = new File(docRoot + "/" + fileName);
		log.info("삭제할 파일(fileDelete): " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		
		log.info("파일 삭제 여부(true/false) : " + result);
	}
}