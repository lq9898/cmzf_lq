package com.baizhi.dao;

import com.baizhi.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseDao extends BasicDao<Course> {
   List<Course> queryAllUserCourse(@Param("start")Integer start, @Param("rows")Integer rows);
}
