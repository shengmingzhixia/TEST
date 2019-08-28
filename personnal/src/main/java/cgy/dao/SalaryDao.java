package cgy.dao;

import cgy.model.Salary;

import java.util.List;

public interface SalaryDao {
    //查询所有的结算记录 分页
    List<Salary> getSalarysByPage(int firstPageNo, int endPageNo);

    //获得记录数
    int getTotalRows();

    //插入一条新的薪资记录
    boolean insertSalary(Salary salary);

    List<Salary> getSalarys();

}
