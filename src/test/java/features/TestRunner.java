package features;


import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.Assert;
import org.junit.jupiter.api.Test;

public class TestRunner {

    @Karate.Test
    Karate testSample() {
        return Karate.run().relativeTo(getClass());
    }

    @Test
    public void testParallel() {
        Results results = Runner.path("src/test/java/features").tags("~@ignore").parallel(6);
    }

}