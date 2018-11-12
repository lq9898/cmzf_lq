package com.baizhi.impl;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;
    @Override
    public void add(Course course) {
        course.setId(UUID.randomUUID().toString());
        course.setCreateDate(new Date());
        courseDao.insert(course);
    }

    @Override
    public void remove(String id) {
        courseDao.delete(id);
    }

    @Override
    public void motify(Course course) {

    }

    @Override
    public List<Course> findAll() {
        return null;
    }

    @Override
    public Course findById(String id) {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> queryByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return  courseDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotal() {
        return courseDao.queryTotal();
    }

    @Override
    public void removeAll(String[] ids) {
        courseDao.deleteAll(ids);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findAllUserCourse(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return courseDao.queryAllUserCourse(start,rows);
    }
}
