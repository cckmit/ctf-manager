package com.ctf.utils;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.data.annotation.Id;

import java.lang.reflect.Field;
import java.util.List;

@Slf4j
public class EsUtil {

    /**
     * 根据对象中的注解获取ID的字段值
     * @param obj
     * @return
     */
    public static String getESId(Object obj) throws Exception {
        Field[] fields = obj.getClass().getDeclaredFields();
        for(Field f : fields){
            f.setAccessible(true);
            Id esid = f.getAnnotation(Id.class);
            if(esid != null){
                Object value = f.get(obj);
                return value.toString();
            }
        }
        return null;
    }

    public static QueryBuilder getQueryBuilder(Object clazz){
        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();
        Field[] declaredFields = clazz.getClass().getDeclaredFields();
        Object obj = clazz;
        try {
            for(Field field:declaredFields){
                field.setAccessible(true);
                EsUtilAnnotation annotation = field.getAnnotation(EsUtilAnnotation.class);
                Object o = field.get(obj);
                if(o!=null && !"".equals(o.toString())){
                    String value = o.toString();
                    if(annotation!=null){
                        boolean hidden = annotation.hidden();
                        String symbol = annotation.symbol();
                        String name = annotation.name();
                        if(hidden){
                            //隐藏的略过
                            continue;
                        }
                        if("lt".equals(symbol)){
                            boolQueryBuilder.must(QueryBuilders.rangeQuery(StrUtil.isNotEmpty(name)?name:field.getName()).lte(value));
                        }else if("gt".equals(symbol)){
                            boolQueryBuilder.must(QueryBuilders.rangeQuery(StrUtil.isNotEmpty(name)?name:field.getName()).gte(value));
                        }else if("like".equals(symbol)){
                            boolQueryBuilder.must(QueryBuilders.moreLikeThisQuery(new String[]{StrUtil.isNotEmpty(name)?name:field.getName()}, new String[]{value}, null));
                        }else if("prefix".equals(symbol)) {
                            boolQueryBuilder.must(QueryBuilders.prefixQuery(StrUtil.isNotEmpty(name)?name:field.getName(),value));
                        }else if("mustNot".equals(symbol)){
                            boolQueryBuilder.mustNot(QueryBuilders.termQuery(StrUtil.isNotEmpty(name)?name:field.getName(),value));
                        }else if("in".equals(symbol)){
                            List<String> o1 = (List<String>)o;
                            boolQueryBuilder.must(QueryBuilders.termsQuery(StrUtil.isNotEmpty(name)?name:field.getName(),o1));
                        }else {
                            boolQueryBuilder.must(QueryBuilders.termQuery(StrUtil.isNotEmpty(name)?name:field.getName(),value));
                        }
                        continue;
                    }
                    boolQueryBuilder.must(QueryBuilders.termQuery(field.getName(),o.toString()));
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return boolQueryBuilder;
    }


}
