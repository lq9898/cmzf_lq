package com.baizhi.test;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class CourseTest extends BasicTest {
    @Autowired
    private CourseService courseService;
    @Test
    public void insert(){
       /* Course course = new Course();
        course.setTitle("拉拉");
        course.setFlag("sda");
        course.setCreateDate(new Date());
        courseService.add(course);*/
        /*List<Course> courses = courseService.queryByPage(1, 3);
        for (Course cours : courses) {
            System.out.println(cours);
        }*/
        List<Course> allUserCourse = courseService.findAllUserCourse(1, 2);
        for (Course course : allUserCourse) {
            System.out.println(course);
        }



    }

}
