package com.api.automation.Order;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetAllOrdersRunner {
	@Test
	public Karate runTest(){
		return Karate.run("getAllOrders").relativeTo(getClass());
	}
}
