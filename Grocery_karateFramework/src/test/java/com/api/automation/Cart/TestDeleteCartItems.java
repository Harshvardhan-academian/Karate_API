package com.api.automation.Cart;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestDeleteCartItems {
	@Test
	public Karate runTest(){
		return Karate.run("deleteCartItems").relativeTo(getClass());
	}
}
