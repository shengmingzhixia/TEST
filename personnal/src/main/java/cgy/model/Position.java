package cgy.model;

public class Position {
    private Integer pos_id;
    private String pos_name;
    private Integer pos_dep_id;

    public Position() {
    }

    public Position(String pos_name, Integer pos_dep_id) {
        this.pos_name = pos_name;
        this.pos_dep_id = pos_dep_id;
    }

    public Integer getPos_id() {
        return pos_id;
    }

    public void setPos_id(Integer pos_id) {
        this.pos_id = pos_id;
    }

    public String getPos_name() {
        return pos_name;
    }

    public void setPos_name(String pos_name) {
        this.pos_name = pos_name;
    }

    public Integer getPos_dep_id() {
        return pos_dep_id;
    }

    public void setPos_dep_id(Integer pos_dep_id) {
        this.pos_dep_id = pos_dep_id;
    }

    @Override
    public String toString() {
        return "Position{" +
                "职位编号=" + pos_id +
                ", 职位名称='" + pos_name + '\'' +
                ", 部门编号=" + pos_dep_id +
                '}';
    }
}
