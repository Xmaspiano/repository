/**
 * Created by AlbertXmas on 2017/1/17.
 */

import com.asiagroup.util.subscriber.HomeWatched;
import com.asiagroup.util.subscriber.HomeWatcher;

import java.util.Observer;

/**
 * java中的sleep()和wait()的区别
 * @author Hongten
 * @date 2013-12-10
 */
public class TestD {
    HomeWatched watched = new HomeWatched();
    Object obj;

    public TestD(Object obj){
        this.obj = obj;
    }

    public TestD() {

    }

    Thread1 getThread1(){
        return new Thread1();
    }

    Thread2 getThread2(){
        return new Thread2();
    }

    public void runApp(){
        TestD td = new TestD(this);
        new Thread(td.getThread1()).start();
        new Thread(td.getThread1()).start();
        new Thread(td.getThread1()).start();
        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        new Thread(td.getThread2()).start();
    }

    public static void main(String[] args) {
        new TestD().runApp();
    }

    public class Thread1 implements Runnable{
        @Override
        public void run(){
            synchronized (obj) {
                System.out.println(obj);
                System.out.println("enter thread1...");
                System.out.println("thread1 is waiting...");
                try {
//                    HomeWatcher watcher = new HomeWatcher(watched,obj);
                    //调用wait()方法，线程会放弃对象锁，进入等待此对象的等待锁定池
//                    obj.wait();

//                    System.out.println(watcher.getData()+"==========");
                    HomeWatcher watcher = new HomeWatcher(watched, obj);
                    System.out.println(watcher.getData());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.out.println("thread1 is going on ....");
                System.out.println("thread1 is over!!!");
            }
        }
    }

    public class Thread2 implements Runnable{
        @Override
        public void run(){
            synchronized (obj) {
                System.out.println(obj);
                System.out.println("enter thread2....");
                System.out.println("thread2 is sleep....");
                //只有针对此对象调用notify()方法后本线程才进入对象锁定池准备获取对象锁进入运行状态。

                //给被观察者状态赋值
                watched.setData("start");
                watched.setData("run");
                watched.setData("stop");
//                obj.notify();
//                watched.setData("test test test");
                //==================
                //区别
                //如果我们把代码：TestD.class.notify();给注释掉，即TestD.class调用了wait()方法，但是没有调用notify()
                //方法，则线程永远处于挂起状态。
                try {
                    //sleep()方法导致了程序暂停执行指定的时间，让出cpu该其他线程，
                    //但是他的监控状态依然保持者，当指定的时间到了又会自动恢复运行状态。
                    //在调用sleep()方法的过程中，线程不会释放对象锁。
                    Thread.sleep(10000);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.out.println("thread2 is going on....");
                System.out.println("thread2 is over!!!");
            }
        }
    }
}