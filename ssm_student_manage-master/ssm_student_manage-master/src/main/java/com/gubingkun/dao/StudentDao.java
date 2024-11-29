package com.gubingkun.dao;

import com.gubingkun.dao.Provider.StudentDaoProvider;
import com.gubingkun.domain.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentDao {

    @Select("select * from student")
    List<Student> findAllStudent();

    @Insert("insert into student Values(null,#{name},#{age},#{sex},#{date},#{email},#{address})")
    Integer addStudent(Student student);

    @Select("select * from student where id = #{id}")
    Student findStudentById(int id);

    @Update("update student set name=#{name},age=#{age},sex=#{sex},date=#{date},email=#{email},address=#{address}where id=#{id}")
    void updateStudent(Student student);

    @Delete("delete from student where id = #{id}")
    void deleteStudentById(int id);

    @SelectProvider(type = StudentDaoProvider.class,method = "findStudentByPage")
    List<Student> findStudentByPage(Student student);
}
