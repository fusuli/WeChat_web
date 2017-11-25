package org.fusu.service;

import java.util.List;

import org.fusu.domain.TStudent;
import org.fusu.domain.TStudentVo;

/**
 * 
 * 学生信息的操作接口
 * 
 * @project: StudentManage
 * @ClassName: StudentService
 * @Description:
 * @author Zunqi
 * @date 2017年9月13日
 * 
 *       <p>
 * 		代码搬运工：itstudying.com
 *       <p>
 */
public interface StudentService {
	int insert(TStudent record);

	List<TStudent> queryStudent(TStudentVo tStudentVo);

	TStudent selectByPrimaryKey(String stuId);

	int updateByPrimaryKey(TStudent record);

	int deleteByPrimaryKey(String stuId);
}
