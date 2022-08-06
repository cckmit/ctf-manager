package com.ctf.component.commons.utils;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;

/**
 * 集合工具类
 *
 *
 */
public class CollectionUtils {

	private CollectionUtils() {

	}

	/**
	 * 转换List，只保留List里的Map的values
	 *
	 * @param list 存储Map的List
	 * @return
	 */
	public static List<Object> convertList(List<LinkedHashMap<String, Object>> list) {
		List<Object> objectList = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			objectList.add(StringUtils.join(list.get(i).values(), ","));
		}
		return objectList;
	}

	/**
	 * 过滤分页列表的字段数据
	 *
	 * @param resultList    分页列表
	 * @param roleDataArray 过滤字段数据
	 * @return
	 */
	public static List<LinkedHashMap<String, Object>> convertFilterList(List<LinkedHashMap<String, Object>> resultList, String[] roleDataArray) {
		List<LinkedHashMap<String, Object>> filterList = new ArrayList<LinkedHashMap<String, Object>>();
		for (int i = 0; i < resultList.size(); i++) {
			LinkedHashMap<String, Object> map = new LinkedHashMap<>();
			for (Entry<String, Object> entry : resultList.get(i).entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				map.put(key, value);
			}
			for (int j = 0; j < roleDataArray.length; j++) {
				map.remove(roleDataArray[j]);
			}
			filterList.add(map);
		}
		return filterList;
	}

}
