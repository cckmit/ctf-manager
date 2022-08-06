package com.ctf.model;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.PageInfo;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 公共分页结果
 * @param <T>
 */
@Getter
@Setter
public class CommonPageResult<T> {
    private Long pageNum;
    private Long pageSize;
    private Long total;
    private Boolean hasNextPage;
    private List<T> list;
    private Long totalPages;

    public CommonPageResult(IPage pageInfo) {
        this.pageNum = pageInfo.getCurrent();
        this.pageSize = pageInfo.getSize();
        this.total = pageInfo.getTotal();
        this.hasNextPage = pageInfo.getCurrent() < pageInfo.getPages();
        this.list = pageInfo.getRecords();
        this.totalPages = pageInfo.getPages();
    }

    public CommonPageResult() {
    }

    /**
     * 将PageHelper分页后的list转为分页信息
     */
    public static <T> CommonPageResult<T> restPage(List<T> list) {
        CommonPageResult<T> result = new CommonPageResult<T>();
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        result.setTotalPages((long)pageInfo.getPages());
        result.setPageNum((long)pageInfo.getPageNum());
        result.setPageSize((long)pageInfo.getPageSize());
        result.setTotal(pageInfo.getTotal());
        result.setList(pageInfo.getList());
        return result;
    }

}