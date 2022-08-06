package com.ctf.sequence;

import org.junit.Test;

public class SequenceTest {

	@Test
	public void testSequence1() {
		try {
			int times = 0, maxTimes = 1000;
			Sequence sequence = new Sequence();
			for (int i = 0; i < maxTimes; i++) {
				long id = sequence.nextId();
				if(id%2==0){
					times++;
				}
				Thread.sleep(10);
			}
			System.out.println("偶数:" + times + ",奇数:" + (maxTimes - times) + "!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSequence2(){
		Sequence sequence = new Sequence();

		for (int i=0;i<10000;i++){
			long id=sequence.nextId();
			System.out.println(id);
		}
	}

}
