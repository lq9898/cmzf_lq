package com.baizhi.service;

import com.baizhi.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseService extends Iservice<Course> {
    void removeAll(String[] ids);
    List<Course> findAllUserCourse(@Param("page")Integer page, @Param("rows")Integer rows);
}
