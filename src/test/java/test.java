import com.asiagroup.util.subscriber.SubscriberManagerImpl;

import java.util.UUID;

/**
 * Created by AlbertXmas on 2017/1/17.
 */
public class test {
    /*  test  */
    public void runMain(){
        try {
            new Thread(new MyThreadCall()).start();

            Thread.sleep(5000);//2

            new Thread(new MyThreadBack()).start();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public class MyThreadCall extends Thread {
        public void run(){
            System.out.println("Call Function");
            try {
                System.out.println(new SubscriberManagerImpl().getSomeData());//1
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Call back over...");
        }
    }


    public class MyThreadBack extends Thread {
        public void run(){
            System.out.println("Call setMassgae");//3
            SubscriberManagerImpl.homeWatched.setData("test...");
            System.out.println("Call msg end...");
        }
    }


//    public static void main(String[] args){
//        try {
//            new test().runMain();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    public static void main(String[] args){
//        String uuid = UUID.randomUUID().timestamp().toString();
        System.out.println(UUID.randomUUID().timestamp());
    }
}
