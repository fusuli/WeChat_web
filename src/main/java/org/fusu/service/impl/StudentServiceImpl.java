package org.fusu.service.impl;

import java.util.List;

import org.fusu.dao.StudentDao;
import org.fusu.dao.StudentDaoCustom;
import org.fusu.domain.PageEntity;
import org.fusu.domain.TStudent;
import org.fusu.domain.TStudentVo;
import org.fusu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

/**
 * 
 * 学生信息操作的各种实现类
 * 
 * @project: StudentManage
 * @ClassName: StudentServiceImpl
 * @Description:
 * @author Zunqi
 * @date 2017年9月13日
 * 
 *       <p>
 *       代码搬运工：itstudying.com
 *       <p>
 */
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private StudentDaoCustom studentDaoCustom;

	@Override
	public int insert(TStudent record) {
		// TODO Auto-generated method stub
		TStudentVo tStudentVO = new TStudentVo();
		tStudentVO.settStudent(record);
		List<TStudent> queryStudent = studentDaoCustom.queryStudent(tStudentVO);
		if (queryStudent.size() > 0) {

			return 0;
		} else {
			return studentDao.insert(record);
		}
	}

	@Override
	public List<TStudent> queryStudent(TStudentVo tStudentVo) {
		// TODO Auto-generated method stub
		if (tStudentVo != null && tStudentVo.getPageEntity() != null) {
			PageHelper.startPage(tStudentVo.getPageEntity().getPageNum(), tStudentVo.getPageEntity().getPageSize());
		} else {
			PageEntity pageEntity = new PageEntity();
			PageHelper.startPage(pageEntity.getPageNum(), pageEntity.getPageSize());
		}
		return studentDaoCustom.queryStudent(tStudentVo);
	}

	@Override
	public TStudent selectByPrimaryKey(String stuId) {
		// TODO Auto-generated method stub
		return studentDao.selectByPrimaryKey(Integer.parseInt(stuId));
	}

	@Override
	public int updateByPrimaryKey(TStudent record) {
		// TODO Auto-generated method stub
		TStudentVo tStudentVO = new TStudentVo();
		TStudent tempStudent = new TStudent();
		tempStudent.setStuNumber(record.getStuNumber());
		tStudentVO.settStudent(tempStudent);
		List<TStudent> queryStudent = studentDaoCustom.queryStudent(tStudentVO);
		if (queryStudent.size() > 0) {

			return 0;
		} else {
			return studentDao.updateByPrimaryKey(record);
		}
	}

	@Override
	public int deleteByPrimaryKey(String stuId) {
		// TODO Auto-generated method stub
		return studentDao.deleteByPrimaryKey(Integer.parseInt(stuId));
	}

}
