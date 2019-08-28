package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Reward {
    private Integer r_id;
    private Integer r_e_id;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date r_date;
    private String r_reason;
    private double r_money;

    public Reward() {
    }

    public String getR_reason() {
        return r_reason;
    }

    public void setR_reason(String r_reason) {
        this.r_reason = r_reason;
    }

    public Integer getR_id() {
        return r_id;
    }

    public void setR_id(Integer r_id) {
        this.r_id = r_id;
    }

    public Integer getR_e_id() {
        return r_e_id;
    }

    public void setR_e_id(Integer r_e_id) {
        this.r_e_id = r_e_id;
    }

    public Date getR_date() {
        return r_date;
    }

    public void setR_date(Date r_date) {
        this.r_date = r_date;
    }

    public double getR_money() {
        return r_money;
    }

    public void setR_money(double r_money) {
        this.r_money = r_money;
    }

    @Override
    public String toString() {
        return "Reward{" +
                "r_id=" + r_id +
                ", r_e_id=" + r_e_id +
                ", r_date=" + r_date +
                ", r_reason='" + r_reason + '\'' +
                ", r_money=" + r_money +
                '}';
    }
}
