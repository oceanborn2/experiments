package shuffler;


import jdk.nashorn.internal.ir.annotations.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.security.SecureRandom;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

@RunWith(JUnit4.class)
public class ParallelUnorderedSchedulerTest {

    final int SIZE = 20;
    final int FACTOR = 4;

    final Random u = new SecureRandom();

    public ParallelUnorderedSchedulerTest() {
    }


    @Test
    public void testInOrder() {
        Tuple<Integer, Integer>[] items = new Tuple[SIZE]; //TODO:How to new with generics T,U types ?

        int index = 0;
        for (int i = 0; i < SIZE / FACTOR; i++) {
            for (int j = 0; j < FACTOR; j++) {
                items[index++] = new Tuple(i, u.nextInt(SIZE * 100));
            }
        }
        for (int j = index; j < SIZE; j++) {
            items[j] = new Tuple(j, u.nextInt(SIZE * 100));
        }

        runTest(items);
    }

    @Test
    @Ignore
    public void testUnordered() {
        Tuple<Integer, Integer>[] items = new Tuple[SIZE]; //TODO:How to new with generics T,U types ?
        Random u = new SecureRandom();
        for (int i = 0; i < SIZE; i++) {
            items[i] = new Tuple(u.nextInt(20), u.nextInt(SIZE * 100));
        }
        runTest(items);
    }


    public void runTest(Tuple<Integer, Integer>[] items) {

        Comparator<Tuple<Integer, Integer>> comp = new Comparator<Tuple<Integer, Integer>>() {
            @Override
            public int compare(Tuple<Integer, Integer> o1, Tuple<Integer, Integer> o2) {
                return o1.t().compareTo(o2.t());
            }
        };

        ParallelUnorderedScheduler scheduler = new ParallelUnorderedScheduler();
        scheduler.preparePlan(items, comp);
        List<List<Integer>> groups = scheduler.scheduleGroups(items, comp);
        for (Tuple<Integer, Integer> item : items) {
            System.out.println(item.t() + "::" + item.u());
        }

        System.out.println("");
        System.out.println("");

        if (groups != null && groups.size() > 0) {
            for (List<Integer> group : groups) {
                for (Integer item : group) {
                    System.out.println(item);
                }
                System.out.println("");
            }
        }
    }
}
