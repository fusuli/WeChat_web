package org.fusu.domain;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
* 
* 用于存放分页的信息，分页信息配置
* 
* @project: StudentManage
* @ClassName: PageEntity
* @Description: 
* @author Zunqi
* @date 2017年9月13日
* 
* <p>代码搬运工：itstudying.com<p>
*/
@Component
@Scope(value="prototype")
public class PageEntity {

	private Integer pageNum = 1;
	private Integer pageSize = 5;

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
