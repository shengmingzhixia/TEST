package cgy.service;

import cgy.model.Page;
import cgy.model.Salary;
import cgy.model.Salary2;

import java.util.List;

public interface SalaryService {
    Page<Salary2> getSalaryByPage(int pageNo);

    boolean insertSalarys();

    Salary getSalary(Integer s_e_id);

    List<Salary> getSalarys(Integer e_id);

    boolean update(Salary salary, String reason);

    boolean update2(Salary salary);
}
