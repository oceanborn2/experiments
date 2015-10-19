import com.tinkerpop.blueprints.Graph
import com.tinkerpop.blueprints.Vertex
import com.tinkerpop.blueprints.impls.neo4j.Neo4jGraph
import com.tinkerpop.gremlin.groovy.Gremlin

/**
 * Created by Pascal.Munerot on 20/10/2015.
 */


class GraphAlgorithms {
    static {
        Gremlin.load()
    }

    public static Map<Vertex, Integer> eigenvectorRank(Graph g) {
        Map<Vertex, Integer> m = [:]; int c = 0
        g.V.as('x').out.groupCount(m).loop('x') { c++ < 1000 }.iterate()
        return m
    }
}

println(GraphAlgorithms.eigenvectorRank(new Neo4jGraph("graphdata")))

