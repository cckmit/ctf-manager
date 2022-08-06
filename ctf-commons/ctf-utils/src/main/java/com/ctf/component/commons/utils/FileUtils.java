package com.ctf.component.commons.utils;

import com.ctf.component.commons.exception.ServiceException;
import org.springframework.util.ResourceUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * 文件工具类
 *
 *
 */
public class FileUtils {

	private FileUtils() {

	}

	/**
	 * 下载文件
	 *
	 * @param originalFilename 文件名称
	 * @param url              下载URL
	 * @param response         响应对象
	 * @throws IOException
	 */
	public static void downloadFile(String originalFilename, String url, HttpServletResponse response) throws IOException {
		ServletOutputStream servletOutputStream = null;
		try {
			servletOutputStream = response.getOutputStream();
			response.setCharacterEncoding("utf-8");
			response.setHeader("Content-Disposition", "attachment;filename=" + originalFilename);
			response.setContentType("application/octet-stream");
			File rootDirectoryPath = new File(ResourceUtils.getURL("classpath:").getPath());
			String path = rootDirectoryPath + url;
			File file = new File(path);
			if (!file.exists()) {
				throw new FileNotFoundException("找不到此文件： " + originalFilename);
			}
			byte[] bytes = Files.readAllBytes(Paths.get(path));
			servletOutputStream.write(bytes);
			servletOutputStream.flush();
		} catch (Exception e) {
			throw new ServiceException(e.toString());
		} finally {
			if (servletOutputStream != null) {
				servletOutputStream.close();
			}
		}
	}

}
