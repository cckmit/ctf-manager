package com.ctf.component.commons.utils;

import com.ctf.component.commons.exception.ServiceException;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 代码生成器工具类
 *
 *
 */
public class GeneratorUtils {

	/**
	 * 获取模板
	 */
	public static List<String> getTemplates() {
		List<String> templates = new ArrayList<String>();
		templates.add("template/Entity.java.vm");
		templates.add("template/Mapper.java.vm");
		templates.add("template/Service.java.vm");
		templates.add("template/ServiceImpl.java.vm");
		templates.add("template/Controller.java.vm");
		templates.add("template/Mapper.xml.vm");
		templates.add("template/VueEntity.vue.vm");
		templates.add("template/MobileEntity.vue.vm");
		templates.add("template/Entity.js.vm");
		templates.add("template/EntityModel.js.vm");
		return templates;
	}

	/**
	 * 生成代码
	 */
	public static void generateResource(LinkedHashMap<String, Object> codeMap, List<LinkedHashMap<String, Object>> fieldList, ZipOutputStream zipOutputStream) {
		// 设置Velocity资源加载器
		Properties properties = new Properties();
		properties.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		Velocity.init(properties);

		String packageName = (String) codeMap.get("packageName");
		String entityName = (String) codeMap.get("entityName");
		String tableName = (String) codeMap.get("tableName");

		// 封装模板数据
		Map<String, Object> map = new HashMap<>();
		map.put("packageName", packageName);
		map.put("entityName", entityName);
		map.put("lowercaseEntityName", entityName.toLowerCase());// 字母全部小写
		map.put("lowercaseFirstOneEntityName", toLowerCaseFirstOne(entityName));// 首字母转小写
		map.put("tableName", tableName);
		map.put("fieldList", fieldList);
		VelocityContext velocityContext = new VelocityContext(map);

		// 获取模板列表
		List<String> templates = getTemplates();
		for (String template : templates) {
			// 渲染模板
			StringWriter stringWriter = new StringWriter();
			Template tpl = Velocity.getTemplate(template, "UTF-8");
			tpl.merge(velocityContext, stringWriter);

			try {
				// 添加到Zip
				zipOutputStream.putNextEntry(new ZipEntry(getFileName(template, entityName, packageName, tableName, toLowerCaseFirstOne(entityName))));
				IOUtils.write(stringWriter.toString(), zipOutputStream, "UTF-8");
				IOUtils.closeQuietly(stringWriter);
				zipOutputStream.closeEntry();
			} catch (IOException e) {
				throw new ServiceException("渲染模板失败，表名：" + entityName, e);
			}
		}
	}

	/**
	 * 获取文件名
	 */
	public static String getFileName(String template, String entityName, String packageName, String tableName, String lowercaseFirstOneEntityName) {
		String packagePath = "main" + File.separator + "java" + File.separator;
		if (StringUtils.isNotBlank(packageName)) {
			packagePath += packageName.replace(".", File.separator) + File.separator;
		}
		if (template.contains("Entity.java.vm")) {
			return packagePath + "entity" + File.separator + entityName + ".java";
		}
		if (template.contains("Mapper.java.vm")) {
			return packagePath + "mapper" + File.separator + entityName + "Mapper.java";
		}
		if (template.contains("Service.java.vm")) {
			return packagePath + "service" + File.separator + entityName + "Service.java";
		}
		if (template.contains("ServiceImpl.java.vm")) {
			return packagePath + "service" + File.separator + "impl" + File.separator + entityName + "ServiceImpl.java";
		}
		if (template.contains("Controller.java.vm")) {
			return packagePath + "controller" + File.separator + entityName + "Controller.java";
		}
		if (template.contains("Mapper.xml.vm")) {
			return "main" + File.separator + "resources" + File.separator + packageName.replace(".", File.separator) + File.separator + "mapper"
					+ File.separator + entityName + "Mapper.xml";
		}
		if (template.contains("Entity.js.vm")) {
			return "react" + File.separator + entityName + ".js";
		}
		if (template.contains("EntityModel.js.vm")) {
			return "react" + File.separator + "models" + File.separator + lowercaseFirstOneEntityName + ".js";
		}
		if (template.contains("VueEntity.vue.vm")) {
			return "vue" + File.separator + entityName + ".vue";
		}
		if (template.contains("MobileEntity.vue.vm")) {
			return "mobile" + File.separator + entityName + ".vue";
		}
		return null;
	}

	/**
	 * 首字母转小写
	 *
	 * @return
	 */
	public static String toLowerCaseFirstOne(String s) {
		if (Character.isLowerCase(s.charAt(0))) {
			return s;
		} else {
			return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
		}
	}

}
