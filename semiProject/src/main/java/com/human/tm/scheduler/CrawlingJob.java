package com.human.tm.scheduler;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;


public class CrawlingJob extends QuartzJobBean {
	
	@Autowired
	Crawling crawl;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		crawl.Crawl();
	}

	public void setCrawl(Crawling crawl) {
		this.crawl = crawl;
	}
	
}
