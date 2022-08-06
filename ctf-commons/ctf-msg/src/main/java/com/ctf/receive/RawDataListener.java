package com.ctf.receive;

import com.alibaba.fastjson.JSONObject;
import com.ctf.enums.KafkaMsgEnums;
import com.ctf.feign.*;
import com.ctf.utils.result.CommonResult;
import com.ctf.utils.vo.ResultEnum;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * kafka监听
 *
 * @author william
 * 2019-6-12 14:23:41
 */
@Slf4j
@Component
public class RawDataListener {
    @Autowired
    KafkaTemplate kafkaTemplate;
    @Autowired
    FinanceClient financeClient;

    /**
     * 实时获取kafka数据(生产一条，监听生产topic自动消费一条)
     *
     * @param record
     * @throws IOException
     */
    @KafkaListener(topics = {"${kafka.consumer.topic.finance}"}, groupId = "${kafka.consumer.group.id}")
    public void financeListener(ConsumerRecord<?, ?> record) throws IOException {
        String value = (String) record.value();
        String key = (String) record.key();
        String topic = record.topic();
        long offset = record.offset();
        //消费信息
        log.info("kafka信息消费：offset={} topic={} key={} value={}", offset, topic, key, value);
        if (StringUtils.isEmpty(key)) {
            return;
        }

        if (match(KafkaMsgEnums.FINANCE_CUSTOMS_RECEIVABLE, record)) {
            log.info("写入金蝶报关应收数据...");
            Map<String, String> msg = new HashMap<>();
            msg.put("msg", value);
            Boolean aBoolean = financeClient.saveReceivableBill(JSONObject.toJSONString(msg));
            System.out.println(aBoolean);
        }
        if (match(KafkaMsgEnums.FINANCE_CUSTOMS_PAYABLE, record)) {
            log.info("写入金蝶报关应付数据...");
            Map<String, String> msg = new HashMap<>();
            msg.put("msg", value);
            Boolean aBoolean = financeClient.savePayableBill(JSONObject.toJSONString(msg));
            System.out.println(aBoolean);

//            doLog(commonResult);
        }
    }

    private void doLog(CommonResult commonResult) {
        if (commonResult.getCode() != ResultEnum.SUCCESS.getCode()) {
            log.error(commonResult.getMsg());
        }
    }


    private Boolean match(KafkaMsgEnums enums, ConsumerRecord<?, ?> record) {
        if (Objects.equals(enums.getTopic(), record.topic()) && Objects.equals(enums.getKey(), record.key())) {
            return true;
        }
        return false;
    }

}
