package com.ctf.sequence;

import java.sql.Timestamp;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/**
 * 利用ScheduledExecutorService实现高并发场景下System.curentTimeMillis()的性能问题的优化.
 *
 * @ClassName SystemClock
 * @Description TODO
 * @Author H.m
 * @Date 2022/7/24 上午1:00
 * @Version 1.0
 **/
public enum SystemClock {

    INSTANCE(1);

    private final long period;
    private final AtomicLong nowTime;
    private boolean started = false;
    private ScheduledExecutorService executorService;

    SystemClock(long period) {
        this.period = period;
        this.nowTime = new AtomicLong(System.currentTimeMillis());
    }


    public void initialize() {
        if (started) {
            return;
        }

        this.executorService = new ScheduledThreadPoolExecutor(1, r -> {
            Thread thread = new Thread(r, "system-clock");
            thread.setDaemon(true);
            return thread;
        });
        executorService.scheduleAtFixedRate(() -> nowTime.set(System.currentTimeMillis()),
                this.period, this.period, TimeUnit.MILLISECONDS);
        Runtime.getRuntime().addShutdownHook(new Thread(this::destroy));
        started = true;
    }


    public long currentTimeMillis() {
        return started ? nowTime.get() : System.currentTimeMillis();
    }


    public String currentTime() {
        return new Timestamp(currentTimeMillis()).toString();
    }


    public void destroy() {
        if (executorService != null) {
            executorService.shutdown();
        }
    }
}
