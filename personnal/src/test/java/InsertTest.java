import cgy.dao.DepartmentDao;
import cgy.model.Department;
import cgy.service.DepartmentService;
import cgy.service.impl.DepartmentServiceImpl;
import oracle.sql.DATE;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;


public class InsertTest {
    private DepartmentDao departmentService;

    @Test
    public void test1() {
        Date d=new Date();
        SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String ss=sd.format(d);
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        departmentService = (DepartmentDao) context.getBean("departmentDao");
        Department department = new Department("法律科", d);
        System.out.println(department);
        boolean b = departmentService.insertDepart(department);
        if (b) {
            System.out.println("插入成功");
        } else {
            System.out.println("false");
        }
    }


}
