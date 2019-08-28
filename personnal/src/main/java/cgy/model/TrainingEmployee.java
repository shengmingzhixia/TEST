package cgy.model;

public class TrainingEmployee {
    private Integer t_id;
    private Integer e_id;

    public TrainingEmployee() {
    }

    public TrainingEmployee(Integer t_id, Integer e_id) {
        this.t_id = t_id;
        this.e_id = e_id;
    }

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }

    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    @Override
    public String toString() {
        return "TrainingEmployee{" +
                "t_id=" + t_id +
                ", e_id=" + e_id +
                '}';
    }
}

