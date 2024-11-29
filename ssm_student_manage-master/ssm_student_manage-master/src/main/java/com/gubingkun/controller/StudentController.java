package com.gubingkun.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gubingkun.domain.Student;
import com.gubingkun.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 查找学生 条件查询
     * */
    @RequestMapping("/findStudentByPage")
    public ModelAndView findStudentByPage(HttpServletRequest request, ModelAndView modelAndView, String pageNum, String pageSize, String pages, Student student/*String name,String sex ,String address*/){
        int pagess;
        if (pageNum==null||"".equals(pageNum)){
            pageNum="1";
        }
        if (pages==null||"".equals(pages)){
            int pageNums = Integer.parseInt(pageNum);
            pagess = pageNums+1;
        }else{
            pagess = Integer.parseInt(pages);
        }
        if (pageSize==null||"".equals(pageSize)){
            pageSize="5";
        }
        int pageNums = Integer.parseInt(pageNum);
        if (pageNums<=0){
            pageNums=1;
        }
        int pageSizes = Integer.parseInt(pageSize);
        if (pageNums>pagess){
            pageNums = pagess;
        }
        //设置分页相关参数   当前页+每页显示的条数
        PageHelper.startPage(pageNums,pageSizes);
        List<Student> studentList = studentService.findStudentByPage(student);
        //        //将查询条件存到request共享域中
        request.setAttribute("student",student);
        //获得与分页相关参数
        PageInfo<Student> pageInfo = new PageInfo<Student>(studentList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("/list.jsp");
        return modelAndView;
    }


    /**
     * 添加学生
    * */
    @RequestMapping("/addStudent")
    public String addStudent(Student student){
        studentService.addStudent(student);
        return "redirect:/findStudentByPage";
    }

    /**
     *查找学生
    * */
    @RequestMapping("/findStudentById")
    public String findStudentById(int id,HttpServletRequest request)  {
        Student student = studentService.findStudentById(id);
        request.setAttribute("student",student);
        return "forward:/update.jsp";
    }


    /**
     * 修改学生
    * */
    @RequestMapping("/updateStudent")
    public String updateStudent(Student student){
        studentService.updateStudent(student);
        return "redirect:/findStudentByPage";
    }

    /**
     * 删除学生
    * */
    @RequestMapping("/deleteStudentById")
    public String deleteStudentById(int id){
        studentService.deleteStudentById(id);
        return "redirect:/findStudentByPage";
    }

    /**
     * 删除选中学生
    * */
    @RequestMapping("/deleteSelectedStudent")
    public String deleteSelectedStudent(int[] uid){

        studentService.deleteSelectedStudent(uid);
        return "redirect:/findStudentByPage";

    }


}




















