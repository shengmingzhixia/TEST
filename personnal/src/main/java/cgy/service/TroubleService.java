package cgy.service;

import cgy.model.Trouble;
import cgy.model.Trouble2;

import java.util.List;

public interface TroubleService {
    List<Trouble2> getTroubles();

    boolean updateState(Trouble trouble);
}
