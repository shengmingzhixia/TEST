package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Salary2 {
    private Integer s_id;
    private Integer s_e_id;
    private String s_e_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date s_date;
    private double s_performance;
    private double s_extra;
    private double s_reward;
    private double s_insurance;
    private double s_total;
    private Integer s_is_trouble;

    public Salary2() {
    }

    public Salary2(Salary salary, String s_e_name) {
        this.s_id = salary.getS_id();
        this.s_e_id = salary.getS_e_id();
        this.s_date = salary.getS_date();
        this.s_performance = salary.getS_performance();
        this.s_extra = salary.getS_extra();
        this.s_reward = salary.getS_reward();
        this.s_insurance = salary.getS_insurance();
        this.s_total = salary.getS_total();
        this.s_is_trouble = salary.getS_is_trouble();
        this.s_e_name = s_e_name;
    }


    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public Integer getS_e_id() {
        return s_e_id;
    }

    public void setS_e_id(Integer s_e_id) {
        this.s_e_id = s_e_id;
    }

    public String getS_e_name() {
        return s_e_name;
    }

    public void setS_e_name(String s_e_name) {
        this.s_e_name = s_e_name;
    }

    public Date getS_date() {
        return s_date;
    }

    public void setS_date(Date s_date) {
        this.s_date = s_date;
    }

    public double getS_performance() {
        return s_performance;
    }

    public void setS_performance(double s_performance) {
        this.s_performance = s_performance;
    }

    public double getS_extra() {
        return s_extra;
    }

    public void setS_extra(double s_extra) {
        this.s_extra = s_extra;
    }

    public double getS_reward() {
        return s_reward;
    }

    public void setS_reward(double s_reward) {
        this.s_reward = s_reward;
    }

    public double getS_insurance() {
        return s_insurance;
    }

    public void setS_insurance(double s_insurance) {
        this.s_insurance = s_insurance;
    }

    public double getS_total() {
        return s_total;
    }

    public void setS_total(double s_total) {
        this.s_total = s_total;
    }

    public Integer getS_is_trouble() {
        return s_is_trouble;
    }

    public void setS_is_trouble(Integer s_is_trouble) {
        this.s_is_trouble = s_is_trouble;
    }

    @Override
    public String toString() {
        return "Salary2{" +
                "s_id=" + s_id +
                ", s_e_id=" + s_e_id +
                ", s_e_name='" + s_e_name + '\'' +
                ", s_date=" + s_date +
                ", s_performance=" + s_performance +
                ", s_extra=" + s_extra +
                ", s_reward=" + s_reward +
                ", s_insurance=" + s_insurance +
                ", s_total=" + s_total +
                ", s_is_trouble=" + s_is_trouble +
                '}';
    }
}
