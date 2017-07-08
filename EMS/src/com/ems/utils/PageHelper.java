package com.ems.utils;
/**
 * 分页实现类
 * @author 崔皓然
 * create on 2017-4-10
 */
public class PageHelper {
	private int recordNum;//每页记录数
	private int nowPage;//当前第几页
	private int recordSum;//记录总数
	private int sumPage;//总页数
	private String sql;//查询语句
	private String condition;//查询条件
	private String url;//跳转地址
	public int getRecordNum() {
		return recordNum;
	}
	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getRecordSum() {
		return recordSum;
	}
	public void setRecordSum(int recordSum) {
		this.recordSum = recordSum;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public PageHelper() {
		super();
		nowPage=1;
	}
	
	public int getSumPage() {
		return sumPage;
	}
	public void setSumPage(int sumPage) {
		this.sumPage = sumPage;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public static PageHelper getpage(String sql,int recordNum,String condition,String url){
		PageHelper page=new PageHelper();
		page.setRecordNum(recordNum);
		page.setCondition(condition);
		page.setUrl(url);
		page.setSql(sql);
		page.setRecordSum(DbHelper.queryCountForInt("select count(*) from ("+sql+") t"));
		page.setSumPage(page.getRecordSum()/page.getRecordNum());
		if(page.getRecordSum()%page.getRecordNum()!=0){
			page.setSumPage(page.getSumPage()+1);
		}
		return page;
	}
	
}
