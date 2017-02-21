package com.asiagroup.app.util;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by AlbertXmas on 2017/2/20.
 */
public class AppCommonTool {

    /*
     * 找出两个数组中不相同的元素
     */
    public static Set<String>[] getDiffernt(String[] a, String[] b){

        Set<String> different_after = new HashSet<String>();  //b数组中与a数组不同的元素
        Set<String> different_before = new HashSet<String>();  //a数组中与b数组不同的元素

        for (int i = 0; i < a.length; i++) {
            different_before.add(a[i]);   //把数组a中的元素放到Set中，可以去除重复的元素
        }

        for (int j = 0; j < b.length; j++) {
            //把数组b中的元素添加到different_before中
            //如果different_before中已存在相同的元素，则different_before.add（b[j]）返回false
            if(different_before.add(b[j])){
                different_after.add(b[j]);
            }
            different_before.remove(b[j]);//除去刚添加的元素
        }

        return new Set[]{different_before,different_after};
    }
}
