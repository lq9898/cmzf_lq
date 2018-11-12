package com.baizhi.test;

import com.baizhi.util.ReadMp3;
import org.junit.Test;

public class radioTest extends  BasicTest {
    @Test
    public  void test(){
        String read = ReadMp3.read("F:/ideacode/maven/cmfz_lq/target/cmfz_lq/file/chapter/周杰伦 - 七里香.mp3");
        System.out.println(read);
    }
}
