package com.api.automation.Cart;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestCreateCartRunner {

	@Test
	public Karate runTest() {
		return Karate.run("createNewCart").relativeTo(getClass());
	}
}
