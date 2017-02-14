package com.asiagroup.util.subscriber;

import org.springframework.stereotype.Service;

/**
 * Created by AlbertXmas on 2017/1/17.
 */
public class SubscriberManagerImpl {
    public static final HomeWatched homeWatched = new HomeWatched();
    private final HomeWatcher watcher;

    public SubscriberManagerImpl() throws InterruptedException {
        watcher = new HomeWatcher(SubscriberManagerImpl.homeWatched, this);
    }

    public Object getSomeData() throws InterruptedException {
        return watcher.getData();
    }

    public void setSomeDate(Object someData){
        homeWatched.setData(someData);
    }


    public synchronized static HomeWatched getHomeWatched() {
        return homeWatched;
    }

}
