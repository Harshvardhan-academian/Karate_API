package com.api.automation.Product;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestSingleProductRunner {

	@Test
	public Karate runTest() {
		return Karate.run("getSingleProduct").relativeTo(getClass());
	}
}
