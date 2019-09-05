package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Extra {
    private int ex_id;
    private int ex_e_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ex_start_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ex_end_date;
    private int ex_e_state;
    private String ex_reason;

    public Extra() {
    }

    public Extra(int ex_e_id, Date ex_start_date, Date ex_end_date, int ex_e_state, String ex_reason) {
        this.ex_e_id = ex_e_id;
        this.ex_start_date = ex_start_date;
        this.ex_end_date = ex_end_date;
        this.ex_e_state = ex_e_state;
        this.ex_reason = ex_reason;
    }

    @Override
    public String toString() {
        return "Extra{" +
                "ex_id=" + ex_id +
                ", ex_e_id=" + ex_e_id +
                ", ex_start_date=" + ex_start_date +
                ", ex_end_date=" + ex_end_date +
                ", ex_e_state=" + ex_e_state +
                ", ex_reason='" + ex_reason + '\'' +
                '}';
    }

    public int getEx_id() {
        return ex_id;
    }

    public void setEx_id(int ex_id) {
        this.ex_id = ex_id;
    }

    public int getEx_e_id() {
        return ex_e_id;
    }

    public void setEx_e_id(int ex_e_id) {
        this.ex_e_id = ex_e_id;
    }

    public Date getEx_start_date() {
        return ex_start_date;
    }

    public void setEx_start_date(Date ex_start_date) {
        this.ex_start_date = ex_start_date;
    }

    public Date getEx_end_date() {
        return ex_end_date;
    }

    public void setEx_end_date(Date ex_end_date) {
        this.ex_end_date = ex_end_date;
    }

    public int getEx_e_state() {
        return ex_e_state;
    }

    public void setEx_e_state(int ex_e_state) {
        this.ex_e_state = ex_e_state;
    }

    public String getEx_reason() {
        return ex_reason;
    }

    public void setEx_reason(String ex_reason) {
        this.ex_reason = ex_reason;
    }
}
