package org.fusu.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
* 
* 用于前端向后台提交复杂类型数据时，springmvc可以自动包装
* 
* @project: StudentManage
* @ClassName: TStudentVo
* @Description: 
* @author Zunqi
* @date 2017年9月13日
* 
* <p>代码搬运工：itstudying.com<p>
*/
@Component
@Scope(value="prototype")
public class TStudentVo {
	private TStudent tStudent;
	
	@Autowired
	private PageEntity pageEntity;

	public TStudent gettStudent() {
		return tStudent;
	}

	public void settStudent(TStudent tStudent) {
		this.tStudent = tStudent;
	}

	public PageEntity getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(PageEntity pageEntity) {
		this.pageEntity = pageEntity;
	}

}
