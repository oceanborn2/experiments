import java.util.*;
import java.security.*;

public class Service {

  int seed;

  public Service() {
    seed = new Random().nextInt();
  }

  public String run(String s) throws Exception {
    SecureRandom random = new SecureRandom(s.getBytes());
    byte bytes[] = new byte[20];
    random.nextBytes(bytes);
    return s;
  }

  public static void main(String[] args) throws Exception {
    Service s = new Service();
    System.out.println(s.run("reizjriezjizjg"));
  }

}
