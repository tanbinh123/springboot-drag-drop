
package com.example.springapp;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	private static String UPLOADED_FOLDER = "/tmp/";
	
	private JSONObject getSuccessMessage() {
		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject("{\"success\":true}");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	// implemented only for Fine Uploader
	@RequestMapping(value = "/upload/{qquuid}", method = { RequestMethod.DELETE })
	public @ResponseBody Object uploadDelete(HttpServletRequest request,
			@PathVariable("qquuid") String qquuid) {
		System.out.println("uploadDelete() called");
		String fileName = (String)request.getSession().getAttribute(qquuid);
		try {
			if (fileName != null) {
				Path path = Paths.get(UPLOADED_FOLDER + fileName);
				Files.delete(path);
			}
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		return getSuccessMessage().toString();
	}
	
	@RequestMapping(value = "/upload", method = { RequestMethod.POST })
	public @ResponseBody Object upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		System.out.println("upload() called");
		if (file.isEmpty()) {
			request.setAttribute("message", "Please select a file to upload");
			return "uploadStatus";
		}
		try {
			// for Fine Uploader delete functionality
			String qquuid = request.getParameter("qquuid");
			System.out.println("qquuid=" + qquuid);
			if (qquuid != null) {
				request.getSession().setAttribute(qquuid, file.getOriginalFilename());
			}
			// for Fine Uploader delete functionality ends
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
			Files.write(path, bytes);
			request.setAttribute("message",
					"You have successfully uploaded '" + file.getOriginalFilename() + "'");
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		return getSuccessMessage().toString();
	}
	
	@RequestMapping("/")
	public String index(Map<String, Object> model) {
		System.out.println("index() called");
		return "index";
	}
	
	@RequestMapping("/BootstrapFileInput")
	public String bootstrapFileInput(Map<String, Object> model) {
		System.out.println("BootstrapFileInput() called");
		return "BootstrapFileInput";
	}
	
	@RequestMapping("/Dropzone")
	public String dropzone(Map<String, Object> model) {
		System.out.println("Dropzone() called");
		return "Dropzone";
	}
	
	@RequestMapping("/FineUploader")
	public String fineUploader(Map<String, Object> model) {
		System.out.println("FineUploader() called");
		return "FineUploader";
	}
	
	@RequestMapping("/FormstoneUpload")
	public String formstoneUpload(Map<String, Object> model) {
		System.out.println("FormstoneUpload() called");
		return "FormstoneUpload";
	}
	
	@RequestMapping("/jQueryFiler")
	public String jqueryFiler(Map<String, Object> model) {
		System.out.println("jQueryFiler() called");
		return "jQueryFiler";
	}
	
	@RequestMapping("/jQueryFileUpload")
	public String jqueryFileUpload(Map<String, Object> model) {
		System.out.println("jQueryFileUpload() called");
		return "jQueryFileUpload";
	}
	
	@RequestMapping("/Plupload")
	public String plupload(Map<String, Object> model) {
		System.out.println("Plupload() called");
		return "Plupload";
	}
}
