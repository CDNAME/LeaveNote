package com.note.util;

import java.util.List;

public class PageUtil<T> {
	private int pageSize;//每页显示多少行数据
	private int pageNum;//第几页
	private int rowCount;//一共有多少行
	private int pageCount;//一共有多少页
	private int rowStart;//每页第一行数据的行数
	private int everyPageCount;//每页显示多少页码
	private int everyPageStart;//每页显示的页码开始数
	private int everyPageEnd;//每页显示的页码结束数
	private int firstPageNum;//首页
	private boolean hasPrevious;//是否有上一页
	private int previousPage;//上一页
	private boolean hasNext ;//是否有下一页
	private int nextPage ;//下一页
	private int endPageNum;//尾页
	private List<T> list;//返回查询结果
	
	public PageUtil() {
	}
	
	public PageUtil(String pageNumString , String pageSizeString , int rowCount){
		//每页显示的记录数
		this.pageSize = pageSizeString==null ? 10 : Integer.parseInt(pageSizeString);
		
		//总记录数
		this.rowCount =rowCount;
		//总共多少页
		this.pageCount =(int) Math.ceil(rowCount * 1.0 /pageSize);
		//当前页码数(此处用于当新增数据时的跳转到最后有一页)
		if("addLast".equals(pageNumString)){
			this.pageNum = this.pageCount;
		}else{
			this.pageNum=pageNumString==null ? 1 :Integer.parseInt(pageNumString);
		}
		//如果当前页码数大于总页码数，取总页码数
		if(pageNum >pageCount && pageCount >0){
			this.pageNum =pageCount;
		}
		//本次查询开始的行数
		this.rowStart =(pageNum -1)*pageSize;
		
		this.everyPageCount = 10;
		this.everyPageStart = pageNum -5;
		if(everyPageStart < 1){
			this.everyPageStart = 1;
		}
		//每页显示的页码结束数
		this.everyPageEnd = everyPageStart + 9;
		if(everyPageEnd > pageCount){
			this.everyPageEnd = pageCount;
		}
		if(everyPageEnd-everyPageStart < 9){
			this.everyPageStart = everyPageEnd - 9;
		}
		if(everyPageStart < 1){
			this.everyPageStart = 1;
		}
		
		
		if(pageNum > 1){
			this.hasPrevious = true;
			this.firstPageNum = 1;
			this.previousPage = pageNum - 1;
		}
		if(pageNum < pageCount){
			this.hasNext = true;
			this.nextPage = pageNum + 1;
			this.endPageNum = pageCount;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getRowStart() {
		return rowStart;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getEveryPageCount() {
		return everyPageCount;
	}

	public void setEveryPageCount(int everyPageCount) {
		this.everyPageCount = everyPageCount;
	}

	public int getEveryPageStart() {
		return everyPageStart;
	}

	public void setEveryPageStart(int everyPageStart) {
		this.everyPageStart = everyPageStart;
	}

	public int getEveryPageEnd() {
		return everyPageEnd;
	}

	public void setEveryPageEnd(int everyPageEnd) {
		this.everyPageEnd = everyPageEnd;
	}

	public int getFirstPageNum() {
		return firstPageNum;
	}

	public void setFirstPageNum(int firstPageNum) {
		this.firstPageNum = firstPageNum;
	}

	public boolean isHasPrevious() {
		return hasPrevious;
	}

	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
}