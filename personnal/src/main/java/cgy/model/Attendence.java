package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Attendence {
    private Integer atd_id;
    private Integer atd_e_id;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date atd_start_time;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date atd_end_time;

    public Attendence() {
    }

    public Attendence(Integer atd_e_id, Date atd_start_time, Date atd_end_time) {
        this.atd_e_id = atd_e_id;
        this.atd_start_time = atd_start_time;
        this.atd_end_time = atd_end_time;
    }

    public Integer getAtd_id() {
        return atd_id;
    }

    public void setAtd_id(Integer atd_id) {
        this.atd_id = atd_id;
    }

    public Integer getAtd_e_id() {
        return atd_e_id;
    }

    public void setAtd_e_id(Integer atd_e_id) {
        this.atd_e_id = atd_e_id;
    }

    public Date getAtd_start_time() {
        return atd_start_time;
    }

    public void setAtd_start_time(Date atd_start_time) {
        this.atd_start_time = atd_start_time;
    }

    public Date getAtd_end_time() {
        return atd_end_time;
    }

    public void setAtd_end_time(Date atd_end_time) {
        this.atd_end_time = atd_end_time;
    }

    @Override
    public String toString() {
        return "Attendence{" +
                "atd_id=" + atd_id +
                ", atd_e_id=" + atd_e_id +
                ", atd_start_time=" + atd_start_time +
                ", atd_end_time=" + atd_end_time +
                '}';
    }
}
