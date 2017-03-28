import com.tinkerpop.blueprints.Edge
import com.tinkerpop.blueprints.impls.tg.TinkerGraph
import com.tinkerpop.blueprints.util.io.graphml.GraphMLWriter
import com.tinkerpop.gremlin.groovy.Gremlin

/**
 * Created by Pascal.Munerot on 19/10/2015.
 */
class Gremlin1 {

    static {
        Gremlin.load()
    }

    public List exampleMethod() {

        //TinkerGraph g = TinkerGraphFactory.createTinkerGraph()
        TinkerGraph g = new TinkerGraph();
        def results = []
        Random r = new Random()

        def nodeNames = 'a'..'z'
        nodeNames.each { it ->
            g.addVertex(it)
        }

        def rg = 1..15
        rg.each { it ->

            int vF = 1 + r.nextInt(26)
            int vT = 1 + r.nextInt(26)

            String sF = nodeNames[vF - 1]
            String sT = nodeNames[vT - 1]
            String label = "${sF} -> ${sT}"
            Edge e = g.addEdge(
                    vF * 100 + vT,
                    g.getVertex(sF),
                    g.getVertex(sT),
                    label)

            e.setProperty('val', r.nextGaussian())
            e.setProperty('sum', vF + vT)
            e.setProperty('prod', vF * vT)

            //e.setProperty('label', "${sF} -> ${sT}")

        }

        GraphMLWriter graphMLWriter = new GraphMLWriter(g)
//        File f = new File("GremlinBasic.graphml")
//        if (f.exists()) {
//            f.delete()
//        }
//        f.createNewFile()

        graphMLWriter.outputGraph("GremlinBasic.graphml")
        //new BufferedOutputStream(new FileOutputStream(new File("GremlinBasic.graphml"))))

        //g.v(1).out('knows').fill(results)
//        Vertex a = g.addVertex("A")
//        Vertex b = g.addVertex("B")
//        g.addEdge(1, b, a, "A vers B")

        def edg = g.edges
        edg.each {
            e -> println(e)
        }
        return results
    }
}


def res = new Gremlin1().exampleMethod()
if (res != null) {
    res.each { it -> println(it) }
}
