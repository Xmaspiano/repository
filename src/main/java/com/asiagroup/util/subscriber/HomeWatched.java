package com.asiagroup.util.subscriber;

import java.util.Observable;

/**
 * Created by AlbertXmas on 2017/1/16.
 */
public class HomeWatched extends Observable {
    private static final HomeWatched homeWatched = null;

    public void setData(Object data) {
        setChanged();
        notifyObservers(data);
    }

}
