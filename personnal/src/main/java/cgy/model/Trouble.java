package cgy.model;

public class Trouble {
    private Integer s_id;
    private String s_reason;
    private Integer t_state;

    public Integer getT_state() {
        return t_state;
    }

    public void setT_state(Integer t_state) {
        this.t_state = t_state;
    }

    public Trouble(Integer s_id, String s_reason, Integer t_state) {
        this.s_id = s_id;
        this.s_reason = s_reason;
        this.t_state = t_state;
    }

    public Trouble() {
    }

    public Trouble(Integer s_id, String s_reason) {
        this.s_id = s_id;
        this.s_reason = s_reason;
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public String getS_reason() {
        return s_reason;
    }

    public void setS_reason(String s_reason) {
        this.s_reason = s_reason;
    }

    @Override
    public String toString() {
        return "Trouble{" +
                "s_id=" + s_id +
                ", s_reason='" + s_reason + '\'' +
                ", t_state=" + t_state +
                '}';
    }
}
