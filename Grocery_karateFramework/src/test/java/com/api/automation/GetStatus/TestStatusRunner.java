package com.api.automation.GetStatus;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestStatusRunner {

	@Test
	public Karate runTest() {
		return Karate.run("getStatus").relativeTo(getClass());
	}
}
