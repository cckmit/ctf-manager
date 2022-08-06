package com.ctf.component.commons.utils;

import java.net.NetworkInterface;
import java.security.SecureRandom;
import java.time.Instant;
import java.util.Enumeration;

/**
 * 分布式ID生成器，源自Twitter的Snowflake算法
 *
 *
 */
public class SequenceGenerator {
	private static final int TOTAL_BITS = 64;
	private static final int EPOCH_BITS = 42;
	private static final int NODE_ID_BITS = 10;
	private static final int SEQUENCE_BITS = 12;
	private static final int MAXNODEID = (int) (Math.pow(2, NODE_ID_BITS) - 1);
	private static final int MAXSEQUENCE = (int) (Math.pow(2, SEQUENCE_BITS) - 1);
	private static final long CUSTOM_EPOCH = 1420070400000L;// 自定义Epoch，UTC时间是2015-01-01T00:00:00Z
	private final int globalNodeId;
	private volatile long lastTimestamp = -1L;
	private volatile long sequence = 0L;

	public SequenceGenerator() {
		this.globalNodeId = createNodeId();
	}

	/**
	 * 根据集群节点编号创建分布式ID生成器
	 *
	 * @param nodeId 唯一集群节点编号
	 */
	public SequenceGenerator(int nodeId) {
		if (nodeId < 0 || nodeId > MAXNODEID) {
			throw new IllegalArgumentException(String.format("集群节点编号范围是 %d 到 %d", 0, MAXNODEID));
		}
		this.globalNodeId = nodeId;
	}

	/**
	 * 生成ID
	 *
	 * @return
	 */
	public synchronized long nextId() {
		long currentTimestamp = timestamp();
		if (currentTimestamp < lastTimestamp) {
			throw new IllegalStateException("无效的系统时钟！");
		}
		if (currentTimestamp == lastTimestamp) {
			sequence = (sequence + 1) & MAXSEQUENCE;
			if (sequence == 0) {
				currentTimestamp = waitNextMillis(currentTimestamp);// 序列已用尽，等待下一个毫秒
			}
		} else {
			sequence = 0;
		}
		lastTimestamp = currentTimestamp;
		long id = currentTimestamp << (TOTAL_BITS - EPOCH_BITS);
		id |= (globalNodeId << (TOTAL_BITS - EPOCH_BITS - NODE_ID_BITS));
		id |= sequence;
		return id;
	}

	/**
	 * 根据自定义Epoch获取当前时间戳
	 *
	 * @return
	 */
	private static long timestamp() {
		return Instant.now().toEpochMilli() - CUSTOM_EPOCH;
	}

	/**
	 * 等待到下一个毫秒
	 *
	 * @param currentTimestamp 当前时间戳
	 * @return
	 */
	private long waitNextMillis(long currentTimestamp) {
		while (currentTimestamp == lastTimestamp) {
			currentTimestamp = timestamp();
		}
		return currentTimestamp;
	}

	/**
	 * 创建集群节点编号
	 *
	 * @return
	 */
	private int createNodeId() {
		int nodeId;
		try {
			StringBuilder stringBuilder = new StringBuilder();
			Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
			while (networkInterfaces.hasMoreElements()) {
				NetworkInterface networkInterface = networkInterfaces.nextElement();
				byte[] macAddress = networkInterface.getHardwareAddress();
				if (macAddress != null) {
					for (int i = 0; i < macAddress.length; i++) {
						stringBuilder.append(String.format("%02X", macAddress[i]));
					}
				}
			}
			nodeId = stringBuilder.toString().hashCode();
		} catch (Exception e) {
			nodeId = (new SecureRandom().nextInt());
		}
		nodeId = nodeId & MAXNODEID;
		return nodeId;
	}

}
