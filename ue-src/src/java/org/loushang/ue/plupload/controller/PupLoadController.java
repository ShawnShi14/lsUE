package org.loushang.ue.plupload.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.loushang.ue.util.PlupLoadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/upload")
public class PupLoadController {
	public static final String FileDir = "uploadfile/";
	
	public void uploadUI() {
		
	}
	
	/**上传处理方法*/
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public void upload(org.loushang.ue.plupload.data.Plupload plupload,HttpServletRequest request, HttpServletResponse response) {
		
		plupload.setRequest(request);
		//文件存储路径
		File dir = new File(plupload.getRequest().getSession().getServletContext().getRealPath("/") + FileDir);
		
		try {
			//上传文件
			PlupLoadUtil.upload(plupload, dir);
			//判断文件是否上传成功（被分成块的文件是否全部上传完成）
			if (PlupLoadUtil.isUploadFinish(plupload)) {
			}
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

