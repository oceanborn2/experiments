package shuffler;


import org.junit.Test;

import java.security.SecureRandom;
import java.util.Comparator;
import java.util.Random;

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
                items[index++] = new Tuple<Integer, Integer>(i, u.nextInt(SIZE * 100));
            }
        }
        for (int j = index; j < SIZE; j++) {
            items[j] = new Tuple<Integer, Integer>(j, u.nextInt(SIZE * 100));
        }

        runTest(items);
    }

    @Test
    public void testUnordered() {
        Tuple<Integer, Integer>[] items = new Tuple[SIZE]; //TODO:How to new with generics T,U types ?
        Random u = new SecureRandom();
        for (int i = 0; i < SIZE; i++) {
            items[i] = new Tuple<Integer, Integer>(u.nextInt(20), u.nextInt(SIZE * 100));
        }
    }


    public void runTest(Tuple<Integer, Integer>[] items) {

        Comparator<Tuple<Integer, Integer>> comp = new Comparator<Tuple<Integer, Integer>>() {
            @Override
            public int compare(Tuple<Integer, Integer> o1, Tuple<Integer, Integer> o2) {
                return o1.t().compareTo(o2.t());
            }
        };

        ParallelUnorderedScheduler scheduler = new ParallelUnorderedScheduler();
        //scheduler.schedule(items, comp);
        scheduler.schedule(items, comp);
        for (Tuple<Integer, Integer> item : items) {
            System.out.println(item.t() + "::" + item.u());
        }
    }
}
