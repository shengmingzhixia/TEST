package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.dao.SalaryDao;
import cgy.dao.TroubleDao;
import cgy.model.Employee;
import cgy.model.Salary;
import cgy.model.Trouble;
import cgy.model.Trouble2;
import cgy.service.TroubleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("troubleService")
public class TroubleServiceImpl implements TroubleService {
    @Resource
    private TroubleDao troubleDao;
    @Resource
    private SalaryDao salaryDao;
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public List<Trouble2> getTroubles() {
        List<Trouble> troubles = troubleDao.getTroubles();
        List<Salary> salarys = salaryDao.getSalarys();
        List<Employee> employees = employeeDao.getE(null);
        List<Trouble2> list = new ArrayList<>();
        for (Trouble trouble : troubles) {
            for (Salary salary : salarys) {
                for (Employee employee : employees) {
                    String t_s_id = "" + trouble.getS_id();
                    String s_id = "" + salary.getS_id();
                    String s_e_id = "" + salary.getS_e_id();
                    String e_id = "" + employee.getE_id();
                    if (t_s_id.equals(s_id) && s_e_id.equals(e_id)) {
                        System.out.println("进入此处");
                        Trouble2 trouble2 = new Trouble2(salary, trouble, employee);
                        list.add(trouble2);
                    }
                }
            }
        }
        return list;
    }

    @Override
    public boolean updateState(Trouble trouble) {
        return troubleDao.updateState(trouble);
    }
}
