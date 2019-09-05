package cgy.model;

public class LiZhi {
    private String r_reason;
    private int e_id;

    public LiZhi() {
    }

    public LiZhi(String r_reason, int e_id) {
        this.r_reason = r_reason;
        this.e_id = e_id;
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getR_reason() {
        return r_reason;
    }

    public void setR_reason(String r_reason) {
        this.r_reason = r_reason;
    }

    @Override
    public String toString() {
        return "LiZhi{" +
                "r_reason='" + r_reason + '\'' +
                ", e_id=" + e_id +
                '}';
    }
}
