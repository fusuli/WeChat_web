package org.fusu.dao;

import java.util.List;

import org.fusu.domain.TStudent;
import org.fusu.domain.TStudentVo;


/**
 * 
 * 用于对mybatis逆向工程生成的方法的补充
 * 
 * @project: StudentManage
 * @ClassName: StudentDaoCustom
 * @Description:
 * @author Zunqi
 * @date 2017年9月13日
 * 
 *       <p>
 * 		代码搬运工：itstudying.com
 *       <p>
 */
public interface StudentDaoCustom {

	List<TStudent> queryStudent(TStudentVo tStudentVo);
	

}
