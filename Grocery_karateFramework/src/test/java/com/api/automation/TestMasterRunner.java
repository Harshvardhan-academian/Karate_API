package com.api.automation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestMasterRunner {

	@Test
	public Karate testRun() {
		return Karate.run("master").relativeTo(getClass());
	}
}
