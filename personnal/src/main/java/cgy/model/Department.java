package cgy.model;

import oracle.sql.DATE;
//部门表
public class Department {
    private int dep_id;
    private String dep_name;
    private DATE dep_date;

    public Department() {
    }

    public Department(String dep_name, DATE dep_date) {
        this.dep_name = dep_name;
        this.dep_date = dep_date;
    }

    public int getId() {
        return dep_id;
    }

    public void setId(int dep_id) {
        this.dep_id = dep_id;
    }

    public String getName() {
        return dep_name;
    }

    public void setName(String dep_name) {
        this.dep_name = dep_name;
    }

    public DATE getDate() {
        return dep_date;
    }

    public void setDate(DATE dep_date) {
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
