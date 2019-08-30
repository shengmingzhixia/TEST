package cgy.dao;

import cgy.model.Trouble;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TroubleDao {
    Trouble getTrouble(@Param(value = "s_id") Integer s_id);

    boolean insertTrouble(Trouble trouble);

    List<Trouble> getTroubles();

    boolean updateState(Trouble trouble);
}
