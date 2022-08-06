package com.ctf.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class MybatisPlusUtils {


    public static void main(String[] args) {
        String servicePre = "lenovo-spider-service";
        String serviceApiPre = "lenovo-spider-service-api";
        String[] models = {servicePre+"/lenovo-spider-system-service", serviceApiPre+"/lenovo-spider-system-service-api"};
        for (String model : models) {
            shell(model,"plant_location_data","system");
        }
    }

    private static void shell(String model, String table,String backagePreName) {
        File file = new File(model);
        String path = file.getAbsolutePath();
        AutoGenerator mpg = new AutoGenerator();
        // 全局配置
        com.baomidou.mybatisplus.generator.config.GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir(path + "/src/main/java");
        gc.setFileOverride(true);
        gc.setActiveRecord(true);
        gc.setOpen(false);
        gc.setEnableCache(false);// XML 二级缓存
        gc.setBaseResultMap(true);// XML ResultMap
        gc.setBaseColumnList(true);// XML columList
        gc.setSwagger2(true);
        gc.setAuthor("carr");

        // 自定义文件命名，注意 %s 会自动填充表实体属性！
        gc.setMapperName("%sMapper");
        gc.setXmlName("%sMapper");
        gc.setServiceName("I%sService");
        gc.setServiceImplName("%sServiceImpl");
        gc.setControllerName("%sController");
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("Jayud2021!@#");
        dsc.setUrl("jdbc:mysql://113.100.140.250:8097/spider?useUnicode=true&characterEncoding=UTF-8");
        mpg.setDataSource(dsc);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
        strategy.setInclude(new String[]{table}); // 需要生成的表
        strategy.setEntityLombokModel(true); // 是否为lombok模型
        strategy.setRestControllerStyle(true);
        mpg.setStrategy(strategy);
        String pack = "";
        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.lenovo."+backagePreName);
        pc.setEntity("model");
        pc.setController("controller");
        pc.setMapper("mapper");
        pc.setService("service");
        pc.setServiceImpl("service" + ".impl");
        mpg.setPackageInfo(pc);

        // 注入自定义配置，可以在 VM 中使用 cfg.abc 【可无】
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<>();
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                this.setMap(map);
            }
        };
        if (!model.endsWith("api")) {
            List<FileOutConfig> focList = new ArrayList<>();
            // 调整 xml 生成目录演示
            focList.add(new FileOutConfig("/templates/mapper.xml.vm") {
                @Override
                public String outputFile(TableInfo tableInfo) {
                    return path + "/src/main/java/com/lenovo/"+backagePreName+"/mapper"
                            + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
                }
            });
            cfg.setFileOutConfigList(focList);
        }
        mpg.setCfg(cfg);
        TemplateConfig tc = new TemplateConfig();
        if (model.endsWith("api")) {
            tc.setController(null);
            tc.setService(null);
            tc.setServiceImpl(null);
            tc.setMapper(null);
            tc.setXml(null);
        }  else {
            tc.setEntity(null);
        }
        mpg.setTemplate(tc.setXml(null));

        mpg.execute();

        // 打印注入设置【可无】
        System.err.println(mpg.getCfg().getMap().get("abc"));
    }
}
