package com.human.tm.scheduler;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;


public class ApiCrawlingJob extends QuartzJobBean {
	
	@Autowired
	ApiCrawling apicrawl;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		apicrawl.Crawl();
	}

	public void setApicrawl(ApiCrawling apicrawl) {
		this.apicrawl = apicrawl;
	}
	
	
}
