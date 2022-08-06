package com.ctf.utils;

import lombok.Data;
import org.elasticsearch.search.sort.SortOrder;

import java.util.List;

@Data
public class EsPageRequest {

    private Integer pageNum;

    private Integer size;

    private List<Sort> sorts;

    public EsPageRequest(Integer pageNum,Integer size){
        this.pageNum = pageNum;
        this.size = size;
    }

    @Data
    public static class Sort{
        private String properties;
        private SortOrder sortOrder;

        public Sort(String properties,SortOrder sortOrder){
            this.properties = properties;
            this.sortOrder = sortOrder;
        }
    }
}
