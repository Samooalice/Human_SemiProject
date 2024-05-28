package com.human.tm.util;

public class PageUtil {
	private int nowPage;	
	private int totalCount; 
	
	private int pageRow; 	
	private int pageGroup; 
	
	private int startPage, endPage; 
	private int totalPage; 
	
	private int startRno, endRno; 
	
	public void setPage() {
		setPage(nowPage, totalCount, 15, 5);
	}
	
	public void setPage(int nowPage, int totalCount) {
		setPage(nowPage, totalCount, 15, 5);
	}
	
	public void setPage(int nowPage, int totalCount, int pageRow, int pageGroup) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = pageRow;
		this.pageGroup = pageGroup;
		calcTotalPage();
		calcPage();
		calcRno();
	}
	
	public void calcTotalPage() {
		if(totalCount == 0) {
			totalPage = 1;
		} else {
			totalPage = (totalCount % pageRow == 0) ? (totalCount / pageRow) : (totalCount / pageRow + 1);
		}
	}
	
	public void calcPage() {
		startPage = (nowPage - 1) / pageGroup * pageGroup + 1;
		endPage = (startPage - 1) + pageGroup;
		if(totalPage < endPage) {
			endPage = totalPage;
		}
	}
	
	public void calcRno() {
		startRno = (nowPage - 1) * pageRow + 1;
		endRno = startRno + (pageRow - 1);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage == 0 ? 1 : nowPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRno() {
		return startRno;
	}

	public void setStartRno(int startRno) {
		this.startRno = startRno;
	}

	public int getEndRno() {
		return endRno;
	}

	public void setEndRno(int endRno) {
		this.endRno = endRno;
	}
}
