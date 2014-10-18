package shuffler;

import java.util.Comparator;

/**
 * Shuffle a list of tuples (T,U) whose ordered is decided with type T and comparator.
 * Ensure that the list of tuples will not be ordered anymore
 */

public class ParallelUnorderedScheduler<T, U> {

    public void schedule(Tuple<T, U>[] items, Comparator<? super Tuple<T, U>> comparator) {
        schedule(items, comparator, false);

    }

    protected void schedule(Tuple<T, U>[] items, Comparator<? super Tuple<T, U>> comparator, boolean secondPass) {
        if (items != null && items.length > 0) {

            // and then pick every first item in the groups
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

                while (nt.equals(kt) && scanner < targetLen) {
                    contiguous = true;
                    scanner++;
                    scanner = scanner % targetLen;
                    nextItem = items[scanner];
                    nt = nextItem.t();
                }
                if (contiguous) {
                    if (!kt.equals(nt)) {
                        Tuple<T, U> swap = items[index + 1];
                        items[index + 1] = nextItem;
                        items[scanner] = swap;
                        changeMade = true;
                        contiguous = false; // fixed at least one item
                    }
                }

                if (contiguous && !changeMade) {
                    // Make a final round as the first item may have been left in order (with the second)
                }
                index++;

            }
            if (!secondPass) {
                schedule(items, comparator, true);
            }

        }
    }

}