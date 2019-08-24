package cgy.model;

import java.util.Date;

//部门表
public class Department {
    private int dep_id;
    private String dep_name;
    private Date dep_date;

    public Department() {
    }

    public Department(String dep_name, Date dep_date) {
        this.dep_name = dep_name;
        this.dep_date = dep_date;
    }

    public int getDep_id() {
        return dep_id;
    }

    public void setDep_id(int dep_id) {
        this.dep_id = dep_id;
    }

    public String getDep_name() {
        return dep_name;
    }

    public void setDep_name(String dep_name) {
        this.dep_name = dep_name;
    }

    public Date getDep_date() {
        return dep_date;
    }

    public void setDep_date(Date dep_date) {
        this.dep_date = dep_date;
    }

    @Override
    public String toString() {
        return "Department{" +
                "部门编号=" + dep_id +
                ", 部门名称='" + dep_name + '\'' +
                ", 成立时间=" + dep_date +
                '}';
    }
}
