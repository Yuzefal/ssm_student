package com.gubingkun.service;

import com.gubingkun.domain.Student;

import java.util.List;

public interface StudentService {
    List<Student> findAllStudent();

    void addStudent(Student student);

    Student findStudentById(int id);

    void updateStudent(Student student);

    void deleteStudentById(int id);

    void deleteSelectedStudent(int[] uid);

    List<Student> findStudentByPage(Student student);
}
