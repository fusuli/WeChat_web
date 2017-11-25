package org.fusu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.fusu.domain.TStudent;
import org.fusu.domain.TStudentExample;



public interface StudentDao {
	 int countByExample(TStudentExample example);
		
	 int deleteByExample(TStudentExample example);
	
	 int deleteByPrimaryKey(Integer stuId);
	
	 int insert(TStudent record);
	
	 int insertSelective(TStudent record);
	
	 List<TStudent> selectByExample(TStudentExample example);
	
	 TStudent selectByPrimaryKey(Integer stuId);
	
	 int updateByExampleSelective(@Param("record") TStudent record,
	 @Param("example") TStudentExample example);
	
	 int updateByExample(@Param("record") TStudent record, @Param("example")
	 TStudentExample example);
	
	 int updateByPrimaryKeySelective(TStudent record);
	
	 int updateByPrimaryKey(TStudent record);
}
