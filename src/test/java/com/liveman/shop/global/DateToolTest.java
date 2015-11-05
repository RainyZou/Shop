package com.liveman.shop.global;

import org.junit.Test;

import junit.framework.Assert;

public class DateToolTest {

	@Test
	public void getCurrentTimeTest() {
		String time = DateTool.getCurrentTimeNoZone();
		System.out.println(time);
		Assert.assertNotNull(time);
	}

}
