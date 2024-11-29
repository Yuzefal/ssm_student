package com.gubingkun.service.impl;

import com.gubingkun.dao.StudentDao;
import com.gubingkun.domain.Student;
import com.gubingkun.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public List<Student> findAllStudent() {
        return studentDao.findAllStudent();
    }

    @Override
    public void addStudent(Student student) {
        studentDao.addStudent(student);

    }

    @Override
    public Student findStudentById(int id) {
        return studentDao.findStudentById(id);
    }

    @Override
    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    @Override
    public void deleteStudentById(int id) {
        studentDao.deleteStudentById(id);
    }

    @Override
    public void deleteSelectedStudent(int[] uid) {
        for (int id : uid) {
            studentDao.deleteStudentById(id);
        }
    }

    @Override
    public List<Student> findStudentByPage(Student student) {
        return studentDao.findStudentByPage(student);
    }


}
