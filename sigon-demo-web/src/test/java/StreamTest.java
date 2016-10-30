import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: sigon
 * Time: 15/11/24 上午11:09
 * Project: mr.mrptrader
 * @site: www.sigon.cn
 */
public class StreamTest {
    @Test
    public void streamtest(){
        List<String> list = new ArrayList();
        list.add("abc");
        list.add("bcde");
        list.add("1234");
        System.out.println(list.stream().mapToInt(str -> str.length()).sum());
    }
}
