package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.entity.User;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.Contended;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("findByPage")
    public @ResponseBody Map<String,Object> findByPage(int page,int rows){
        HashMap<String, Object> result = new HashMap<>();
        try {
            List<Course> courses = courseService.queryByPage(page,rows);
            Long total = courseService.findTotal();
            result.put("total",total);
            result.put("rows",courses);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  result;
    }
    @RequestMapping("save")
    public @ResponseBody
    Map<String,Object> save(Course course){
        Map<String, Object> result = new HashMap<>();

        try {
            courseService.add(course);
            result.put("success",true);

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> delete(String id){
        HashMap<String, Object> result = new HashMap<>();

        try {
            courseService.remove(id);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("deleteAll")
    public  @ResponseBody Map<String,Object> deleteAll(String[] id){
        Map<String, Object> result = new HashMap<String,Object>();
        try{

            courseService.removeAll(id);
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return result;
    }
    @ResponseBody
    @RequestMapping("findAllUserCourse")
    public  Map<String,Object> findAllUserCourse(int page,int rows){
        HashMap<String, Object> result = new HashMap<>();

        try {
            List<Course> courses = courseService.findAllUserCourse(page, rows);
            Long total = courseService.findTotal();
            result.put("rows",courses);
            result.put("total",total);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return result;
    }
}
