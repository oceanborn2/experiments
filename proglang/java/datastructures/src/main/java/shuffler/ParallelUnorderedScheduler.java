package shuffler;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * Shuffle a list of tuples (T,U) whose ordered is decided with type T and comparator.
 * Ensure that the list of tuples will not be ordered anymore
 */

public class ParallelUnorderedScheduler<T, U> {

    public /*List<List<U>> */ void preparePlan(Tuple<T, U>[] items, Comparator<? super Tuple<T, U>> comparator) {
        preparePlan(items, comparator, false);
    }

    protected void /*List<List<U>> */ preparePlan(Tuple<T, U>[] items, Comparator<? super Tuple<T, U>> comparator, boolean secondPass) {
        if (items != null && items.length > 0) {
            final int targetLen = items.length;
            boolean contiguous = false;
            boolean changeMade = false;

            int index = 0; // start shuffling whenever we meet a two contiguous items by searching the next different item
            while (index < targetLen) {
                Tuple<T, U> item = items[index];
                T kt = item.t();

                int scanner = (index + 1) % targetLen;
                Tuple<T, U> nextItem = items[scanner];
                T nt = nextItem.t();

                while (comparator.compare(item, nextItem) == 0 && scanner < targetLen) { // nt.equals(kt)
                    contiguous = true;
                    scanner++;
                    scanner = scanner % targetLen;
                    nextItem = items[scanner];
                    nt = nextItem.t();
                }
                if (contiguous) {
                    if (comparator.compare(item, nextItem) != 0) { //!kt.equals(nt)) {
                        Tuple<T, U> swap = items[index + 1];
                        items[index + 1] = nextItem;
                        items[scanner] = swap;
                        changeMade = true;
                        contiguous = false; // fixed at least one item
                    }
                }

                if (contiguous && !changeMade) {
                    // Make a final round as the first item may have been left in order (with the second)
                    break;
                }
                index++;
            }

            if (!secondPass) {
                preparePlan(items, comparator, true);
            }
        }
    }

    public List<List<U>> scheduleGroups(Tuple<T, U>[] items, Comparator comparator) {

        if (items == null || items.length == 0) {
            return null;
        }

        int targetLen = items.length;// now create a list of groups

        List<List<U>> groups = new ArrayList();
        List<U> newGroup = new ArrayList();
        groups.add(newGroup);

        int index = 0;
        Tuple<T, U> item = items[index];
        T kt = item.t();
        newGroup.add(item.u());
        index++;
        Tuple<T, U> nextItem = items[index];
        while (index < targetLen) {
            newGroup.add(nextItem.u());
            nextItem = items[index];
            while (comparator.compare(item, nextItem) != 0) { //!kt.equals(item.t())) {
                newGroup.add(nextItem.u());
                index++;
                if (index == targetLen) break;
                nextItem = items[index];
            }
            newGroup = new ArrayList();
            groups.add(newGroup);
            newGroup.add(nextItem.u());
        }
        return groups;
    }

}