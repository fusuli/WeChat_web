package org.fusu.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.fusu.domain.TStudent;
import org.fusu.domain.TStudentCustom;
import org.fusu.domain.TStudentVo;
import org.fusu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

/**
 * 
 * 用于学生信息的
 * 
 * @project: StudentManage
 * @ClassName: StudentController
 * @Description:
 * @author Zunqi
 * @date 2017年9月13日
 * 
 *       <p>
 * 		代码搬运工：itstudying.com
 *       <p>
 */
@Controller
@RequestMapping("stm")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private TStudentVo tStudentVo;

	@RequestMapping("insert")
	public String insert(HttpSession session) {

		String uuid = UUID.randomUUID().toString();
		session.setAttribute("uuid", uuid);

		return "insert";
	}

	@RequestMapping("insertSubmit")
	public String insertSubmit(String uuid, TStudentCustom studentCustom, HttpSession session, Model model) {

		Object uuidBySession = session.getAttribute("uuid");
		if (uuid != null && uuid.equals(uuidBySession)) {

			int count = studentService.insert(studentCustom);
			if (count == 1) {
				System.out.println("插入成功！");
			} else {
				model.addAttribute("error", "学号重复");
				model.addAttribute("student", studentCustom);
				
				System.out.println("插入失败！count = " + count);
				return "insert";
			}

			session.removeAttribute("uuid");
		} else {
			model.addAttribute("error", "请不要重复提交！");
			model.addAttribute("student", studentCustom);
			return "insert";
		}

		return "forward:queryStudents/1";
	}

	@RequestMapping("index")
	public String index() {

		return "forward:queryStudents/1";
	}

	@RequestMapping("queryStudents/{pageNum}")
	public String queryStudents(Model model, @PathVariable("pageNum") String pageNum) {
		int num = Integer.parseInt(pageNum);
		tStudentVo.getPageEntity().setPageNum(num);
		List<TStudent> students = studentService.queryStudent(tStudentVo);
		model.addAttribute("pageInfo", new PageInfo<TStudent>(students));

		return "list";
	}

	@RequestMapping("queryStudents")
	public String queryStudent(Model model, TStudentVo studentVo) {

		List<TStudent> students = studentService.queryStudent(studentVo);
		model.addAttribute("pageInfo", new PageInfo<TStudent>(students));
		return "list";
	}

	@RequestMapping("updateQuery/{stuId}")
	public String updateQuery(@PathVariable("stuId") String stuId, Model model) {

		TStudent student = studentService.selectByPrimaryKey(stuId);
		model.addAttribute("student", student);
		return "update";
	}

	@RequestMapping("updateSubmit")
	public String updateSubmit(TStudentCustom studentCustom,Model model) {

		int count = studentService.updateByPrimaryKey(studentCustom);
		if (count == 1) {
			System.out.println("修改成功");
		} else {
			model.addAttribute("error", "学号重复");
			model.addAttribute("student", studentCustom);
			
			System.out.println("修改失败！count = " + count);
			return "update";
		}

		return "forward:queryStudents/1";
	}

	@RequestMapping("deleteStudent/{stuid}")
	public String deleteStudent(@PathVariable String stuid) {
		int count = studentService.deleteByPrimaryKey(stuid);
		if (count == 1) {
			System.out.println("删除成功！");
		} else {
			System.out.println("删除失败！count = " + count);
		}

		return "forward:/stm/index";
	}
}
