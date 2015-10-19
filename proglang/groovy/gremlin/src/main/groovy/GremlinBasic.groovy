import com.tinkerpop.blueprints.Graph
import com.tinkerpop.blueprints.Vertex
import com.tinkerpop.blueprints.impls.tg.TinkerGraphFactory
import com.tinkerpop.gremlin.groovy.Gremlin

/**
 * Created by Pascal.Munerot on 19/10/2015.
 */
class Gremlin1 {

    static {
        Gremlin.load()
    }

    public List exampleMethod() {
        Graph g = TinkerGraphFactory.createTinkerGraph()
        def results = []
        g.v(1).out('knows').fill(results)
        Vertex a = g.addVertex("A")
        Vertex b = g.addVertex("B")
        g.addEdge(1, b, a, "A vers B")

        /*def edg = g.edges()
        edg.each { e -> println(e) }
        return results*/
    }
}


def res = new Gremlin1().exampleMethod()
if (res != null) {
    res.each { it -> println(it) }
}
