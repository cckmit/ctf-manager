package com.ctf.utils.utils;

import io.swagger.annotations.ApiModelProperty;

public class FileView {
    @ApiModelProperty(value = "绝对路径")
    private String absolutePath;

    @ApiModelProperty(value = "相对路径")
    private String relativePath;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

}
