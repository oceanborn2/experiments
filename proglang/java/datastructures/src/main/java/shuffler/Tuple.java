package shuffler;

public class Tuple<ComparableObj, AnyObject> {

    public Tuple() {
    }

    public Tuple(ComparableObj comparableObj, AnyObject anyObject) {
        this._comparableObj = comparableObj;
        this._anyObject = anyObject;
    }

    private ComparableObj _comparableObj;
    private AnyObject _anyObject;

    public ComparableObj t() {
        return _comparableObj;
    }

    public AnyObject u() {
        return _anyObject;
    }

}
