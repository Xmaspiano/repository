package com.asiagroup.util.subscriber;

import java.util.Observable;
import java.util.Observer;

/**
 * Created by AlbertXmas on 2017/1/16.
 */
public class HomeWatcher implements Observer {
    Object obj;
    Object data;

    public HomeWatcher(Observable o,Object obj) throws InterruptedException {
        System.out.println("addObserver...");
        o.addObserver(this);
        System.out.println("now Observable size:"+o.countObservers());
        this.obj = obj;
    }

    public HomeWatcher() {

    }

    /**
     * This method is called whenever the observed object is changed. An
     * application calls an <tt>Observable</tt> object's
     * <code>notifyObservers</code> method to have all the object's
     * observers notified of the change.
     *
     * @param o   the observable object.
     * @param arg an argument passed to the <code>notifyObservers</code>
     */
    @Override
    public void update(Observable o, Object arg) {
        synchronized (this.obj) {
            obj.notify();
            this.data = arg;

            o.deleteObserver(this);
        }
    }

    public Object getData() throws InterruptedException {
        synchronized (this.obj) {
                obj.wait();
        }
        return data;
    }

    public static void main(String[] args) throws InterruptedException {
        new HomeWatcher().runMain();
    }

    public void runMain(){

        //创建被观察者对象
        HomeWatched watched = new HomeWatched();
        //创建观察者对象，并将被观察者对象登记
        try {
            HomeWatcher watcher = new HomeWatcher(watched, this);
            HomeWatcher watcher1 = new HomeWatcher(watched, this);
            HomeWatcher watcher2 = new HomeWatcher(watched, this);

            watcher.getData();

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //给被观察者状态赋值
        watched.setData("start");
        watched.setData("run");
        watched.setData("stop");

    }

}
