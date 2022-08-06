package com.ctf.utils;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.DocWriteResponse;
import org.elasticsearch.action.admin.indices.create.CreateIndexRequest;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest;
import org.elasticsearch.action.admin.indices.get.GetIndexRequest;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.script.Script;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.metrics.avg.ParsedAvg;
import org.elasticsearch.search.aggregations.metrics.sum.ParsedSum;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.*;

@Component
@Slf4j
public class ElaticsSearchUtil {

    @Autowired
    private RestHighLevelClient client;

    private static RestHighLevelClient clientStatic;

    @PostConstruct
    private void init(){
        ElaticsSearchUtil.clientStatic = client;
    }

    public static void deleteById(String indexName,String indexType,String id) {
        DeleteRequest deleteRequest = new DeleteRequest(indexName,indexType, id);
        try {
            clientStatic.delete(deleteRequest,RequestOptions.DEFAULT);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 判断索引是否存在
     * @param indexName
     * @return
     * @throws IOException
     */
    public static boolean checkIndexExists(String indexName) {
        GetIndexRequest request = new GetIndexRequest().indices(indexName);
        try {
            return clientStatic.indices().exists(request, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.error("判断索引是否存在，操作异常！");
        }
        return false;
    }

    public static boolean deleteIndex(String indexName){
        DeleteIndexRequest deleteRequest = new DeleteIndexRequest(indexName);
        boolean flag = false;
        try {
            flag = clientStatic.indices().delete(deleteRequest,RequestOptions.DEFAULT).isAcknowledged();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static boolean save(Object t,String indexName, String indexType){
        try {
            String id = EsUtil.getESId(t);
            IndexRequest indexRequest = null;
            if (StringUtils.isEmpty(id)) {
                indexRequest = new IndexRequest(indexName, indexType);
            } else {
                indexRequest = new IndexRequest(indexName, indexType, id);
            }
            indexRequest.source(JSONObject.toJSONString(t, SerializerFeature.WriteDateUseDateFormat),XContentType.JSON);
            IndexResponse indexResponse = clientStatic.index(indexRequest, RequestOptions.DEFAULT);
            if (indexResponse.getResult() == DocWriteResponse.Result.CREATED) {
                log.info("INDEX CREATE SUCCESS");
            } else if (indexResponse.getResult() == DocWriteResponse.Result.UPDATED) {
                log.info("INDEX UPDATE SUCCESS");
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public boolean delete(String id,String indexname) throws Exception {
        if (StringUtils.isEmpty(id)) {
            throw new Exception("ID cannot be empty");
        }
        DeleteRequest deleteRequest = new DeleteRequest(indexname, indexname, id);
        DeleteResponse deleteResponse = null;
        deleteResponse = client.delete(deleteRequest, RequestOptions.DEFAULT);
        if (deleteResponse.getResult() == DocWriteResponse.Result.DELETED) {
            log.info("INDEX DELETE SUCCESS");
        } else {
            return false;
        }
        return true;
    }

    public static<T> T selectOne(QueryBuilder queryBuilder, Class<T> clazz, String indexName, String indexType){
        T t = null;
        SearchRequest searchRequest = new SearchRequest(indexName);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchRequest.source(searchSourceBuilder);
        try {
            SearchResponse searchResponse = clientStatic.search(searchRequest, RequestOptions.DEFAULT);
            SearchHits hits = searchResponse.getHits();
            SearchHit[] searchHits = hits.getHits();
            for (SearchHit hit : searchHits) {
                t = JSONUtil.toBean(hit.getSourceAsString(),clazz);
                return t;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return t;
    }

    public static<T> List<T> selectList(QueryBuilder queryBuilder, Class<T> clazz, String indexName){
        List<T> list = new ArrayList<>();
        SearchRequest searchRequest = new SearchRequest(indexName);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchSourceBuilder.size(10000);
        searchRequest.source(searchSourceBuilder);
        try {
            log.info("获取1w条数据==============={}",JSONObject.toJSONString(queryBuilder));
            SearchResponse searchResponse = clientStatic.search(searchRequest, RequestOptions.DEFAULT);
            log.info("返回1w条数据==============={}",JSONUtil.toJsonStr(searchResponse));
            SearchHits hits = searchResponse.getHits();
            SearchHit[] searchHits = hits.getHits();
            for (SearchHit hit : searchHits) {
                T t = JSONUtil.toBean(hit.getSourceAsString(),clazz);
                list.add(t);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static<T> Page<T> getPage(QueryBuilder queryBuilder, EsPageRequest pageRequest, Class<T> clazz, String indexName){
        Page<T> page = new Page<>();
        List<T> list = new ArrayList<>();
        SearchRequest searchRequest = new SearchRequest(indexName);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchSourceBuilder.from(pageRequest.getPageNum()*pageRequest.getSize());
        searchSourceBuilder.size(pageRequest.getSize());
        List<EsPageRequest.Sort> sorts = pageRequest.getSorts();
        if(CollectionUtil.isNotEmpty(sorts)){
            Iterator<EsPageRequest.Sort> iterator = sorts.iterator();
            while (iterator.hasNext()){
                EsPageRequest.Sort next = iterator.next();
                String property = next.getProperties();
                SortOrder sortOrder = next.getSortOrder();
                searchSourceBuilder.sort(new FieldSortBuilder(property).order(sortOrder));
            }
        }
        searchRequest.source(searchSourceBuilder);
        SearchResponse searchResponse = null;
        try {
            searchResponse = clientStatic.search(searchRequest, RequestOptions.DEFAULT);
            SearchHits hits = searchResponse.getHits();
            SearchHit[] searchHits = hits.getHits();
            for (SearchHit hit : searchHits) {
                T t = JSONUtil.toBean(hit.getSourceAsString(),clazz);
                list.add(t);
            }
            page.setRecords(list);
            page.setTotal(hits.totalHits);
            page.setCurrent(pageRequest.getPageNum());
            page.setSize(pageRequest.getSize());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return page;
    }

    public static<T> void saveList(List<T> list ,String indexName,String indexType){
        if (CollectionUtil.isEmpty(list) || StrUtil.isEmpty(indexName) || StrUtil.isEmpty(indexType)) {
            return ;
        }
        try {
            log.info("es插入====={}",list.size());
            BulkRequest bulkRequest = new BulkRequest();
            for(int i = 0 ;i<list.size();i++){
                Object t = list.get(i);
                String id  = EsUtil.getESId(t);
                log.info("es插入数据=========={}",JSONObject.toJSONString(t, SerializerFeature.WriteDateUseDateFormat));
                bulkRequest.add(new IndexRequest(indexName, indexType, id)
                        .source(JSONObject.toJSONString(t, SerializerFeature.WriteDateUseDateFormat),XContentType.JSON));
            }
            BulkResponse bulkResponse = clientStatic.bulk(bulkRequest, RequestOptions.DEFAULT);
            log.info("es状态====={}",bulkResponse.buildFailureMessage());
            /*for (BulkItemResponse bulkItemResponse : bulkResponse) {
                if (bulkItemResponse.isFailed()) {
                    BulkItemResponse.Failure failure = bulkItemResponse.getFailure();
                    System.out.println("批量插入完成"+failure.getStatus());
                }
            }*/
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Map<String,Object> getAvgTerm(QueryBuilder queryBuilder ,String indexName,String type,String groupFiled,String avgFiled){
        Map<String,Object> map = new HashMap<>();
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchSourceBuilder.size(0);
        AggregationBuilder aggregationBuilder = null;
        boolean flag = StrUtil.isNotEmpty(groupFiled);
        if(flag){
            aggregationBuilder = AggregationBuilders.terms("group_by").script(new Script(groupFiled));
            aggregationBuilder.subAggregation(AggregationBuilders.avg(avgFiled).field(avgFiled));
        }
//        aggregationBuilder.subAggregation(AggregationBuilders.avg(avgFiled));
        searchSourceBuilder.aggregation(aggregationBuilder);
        SearchRequest searchRequest = new SearchRequest(indexName).types(type);
        searchRequest.source(searchSourceBuilder);
        try {
            SearchResponse searchResponse = clientStatic.search(searchRequest, RequestOptions.DEFAULT);
            Terms terms = searchResponse.getAggregations().get("group_by");
            for (Terms.Bucket bucket : terms.getBuckets()) {
                Object key = bucket.getKey();
                ParsedAvg avg = bucket.getAggregations().get("value");
                double value = avg.getValue();
                map.put(key.toString(),value);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    public static Map<String,Object> getSum(QueryBuilder queryBuilder ,String indexName,String type,String groupFiled,String avgFiled){
        Map<String,Object> map = new HashMap<>();
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchSourceBuilder.size(0);
        AggregationBuilder aggregationBuilder = null;
        boolean flag = StrUtil.isNotEmpty(groupFiled);
        if(flag){
            aggregationBuilder = AggregationBuilders.terms("group_by").script(new Script(groupFiled));
            aggregationBuilder.subAggregation(AggregationBuilders.sum(avgFiled).field(avgFiled));
        }else {
            aggregationBuilder = AggregationBuilders.sum(avgFiled).field(avgFiled);
        }
//        aggregationBuilder.subAggregation(AggregationBuilders.avg(avgFiled));
        searchSourceBuilder.aggregation(aggregationBuilder);
        SearchRequest searchRequest = new SearchRequest(indexName).types(type);
        searchRequest.source(searchSourceBuilder);
        try {
            SearchResponse searchResponse = clientStatic.search(searchRequest, RequestOptions.DEFAULT);
            if(flag){
                Terms terms = searchResponse.getAggregations().get("group_by");
                for (Terms.Bucket bucket : terms.getBuckets()) {
                    Object key = bucket.getKey();
                    ParsedSum sum = bucket.getAggregations().get("value");
                    double value = sum.getValue();
                    map.put(key.toString(),value);
                }
            }else {
                ParsedSum sum = searchResponse.getAggregations().get("value");
                map.put("sum",sum.getValue());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }


    public static Map<String,Object> getGroupNew(QueryBuilder queryBuilder ,String indexName,String type,String groupFiled,String sortFiled){
        Map<String,Object> map = new HashMap<>();
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(queryBuilder);
        searchSourceBuilder.size(0);
        searchSourceBuilder.sort(sortFiled,SortOrder.DESC);
        AggregationBuilder aggregationBuilder = null;
        boolean flag = StrUtil.isNotEmpty(groupFiled);
        if(flag){
            aggregationBuilder = AggregationBuilders.terms("group_by").script(new Script(groupFiled));
        }
//        aggregationBuilder.subAggregation(AggregationBuilders.avg(avgFiled));
        searchSourceBuilder.aggregation(aggregationBuilder);
        SearchRequest searchRequest = new SearchRequest(indexName).types(type);
        searchRequest.source(searchSourceBuilder);
        try {
            SearchResponse searchResponse = clientStatic.search(searchRequest, RequestOptions.DEFAULT);
            if(flag){
                Terms terms = searchResponse.getAggregations().get("group_by");
                for (Terms.Bucket bucket : terms.getBuckets()) {
                    Object key = bucket.getKey();
                    ParsedSum sum = bucket.getAggregations().get("value");
                    double value = sum.getValue();
                    map.put(key.toString(),value);
                }
            }else {
                ParsedSum sum = searchResponse.getAggregations().get("value");
                map.put("sum",sum.getValue());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }


    /**
     *
     * 更新某一个字段
     * @param json
     * @param index
     * @param type
     * @param id
     * @return
     */
    public static boolean updateDataById2(String json, String index, String type, String id) {
        UpdateResponse update = null;
        try {
//            UpdateRequest request = new UpdateRequest(index,type,id);
//            IndexRequest indexRequest = new IndexRequest();
//            Map<String,String> map = new HashMap<>();
//            map.put("routeInhouseVo",json);
//            indexRequest.source(map);
//            request.doc(indexRequest);

            UpdateRequest request = new UpdateRequest(index,type,id);
            request.doc(json,XContentType.JSON);
            update = clientStatic.update(request, RequestOptions.DEFAULT);
            log.info("UpdateResponse==={}",update);
            if (update.status().getStatus() == 200){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

}
