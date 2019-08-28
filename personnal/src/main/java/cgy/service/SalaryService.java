package cgy.service;

import cgy.model.Page;
import cgy.model.Salary;
import cgy.model.Salary2;

public interface SalaryService {
    Page<Salary2> getSalaryByPage(int pageNo);

    boolean insertSalarys();
}
