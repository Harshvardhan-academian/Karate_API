package com.api.automation.Cart;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetCartItems {

	@Test
	public Karate testRun() {
		return Karate.run("getCartItems").relativeTo(getClass());
	}
}
