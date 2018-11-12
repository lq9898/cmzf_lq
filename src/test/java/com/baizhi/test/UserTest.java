package com.baizhi.test;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class UserTest extends  BasicTest {
    @Autowired
    private UserService userService;
    @Test
    public void twst(){
        User user = new User();
        user.setCity("武汉");
        user.setDate(new Date());
        user.setHeadPic("hjk");
        user.setNickName("小白");
        user.setPassword("123");
        user.setPhoneNum("15171048685");
        user.setProvince("货");
        user.setSalt("言");
        user.setSign("随心所欲");
        user.setSex("男");
        user.setStatus("y");
        user.setUsername("花花");
        userService.add(user);

    }
    @Test
    public  void RES(){
        List<User> users = userService.queryByPage(1, 2);
        for (User user : users) {
            System.out.println(user);
        }

    }
    @Test
    public  void uh(){


    userService.motityStatus("d4976a7a-bb29-4464-9b9a-e273f3506cdc","F");

    }

}
