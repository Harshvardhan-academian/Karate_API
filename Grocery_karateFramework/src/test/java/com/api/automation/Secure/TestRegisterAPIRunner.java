package com.api.automation.Secure;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRegisterAPIRunner {
	@Test
	public Karate runTest(){
		return Karate.run("registerAPI").relativeTo(getClass());
	}
}
