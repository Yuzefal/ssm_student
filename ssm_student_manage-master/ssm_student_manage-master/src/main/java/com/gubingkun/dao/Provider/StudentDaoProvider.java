package com.gubingkun.dao.Provider;

import com.gubingkun.domain.Student;

public class StudentDaoProvider {

    public String findStudentByPage(Student student) {
        String name = student.getName();
        String sex = student.getSex();
        String address = student.getAddress();

        String sql = "select * from student where 1 = 1";
        if(name!=null&&!"null".equalsIgnoreCase(name)&&!"".equals(name)){
            sql += " and name like '%"+name+"%' ";
        }
        if(sex!=null&&!"null".equalsIgnoreCase(sex)&&!"".equals(sex)){
            sql += " and sex = '"+sex+"' ";
        }
        if(address!=null&&!"null".equalsIgnoreCase(address)&&!"".equals(address)){
            sql += " and address = '"+address+"' ";
        }
        return sql;
    }

}
