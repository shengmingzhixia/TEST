package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Trouble2 {
    private Salary salary;
    private Trouble trouble;
    private Employee employee;

    public Trouble2() {
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Trouble2(Salary salary, Trouble trouble, Employee employee) {
        this.salary = salary;
        this.trouble = trouble;
        this.employee = employee;
    }

    public Trouble getTrouble() {
        return trouble;
    }

    public void setTrouble(Trouble trouble) {
        this.trouble = trouble;
    }

    public Salary getSalary() {
        return salary;
    }

    public void setSalary(Salary salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Trouble2{" +
                "salary=" + salary +
                ", trouble=" + trouble +
                ", employee=" + employee +
                '}';
    }
}
