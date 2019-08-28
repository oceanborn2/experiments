abstract type Keyword{Symbol} end

abstract type Synonym <: Keyword{:Synonym} end
abstract type Antonym <: Keyword{:Antonym} end
abstract type Related <: Keyword{:Related} end
abstract type Similar <: Keyword{:Similar} end

abstract type Node end

mutable struct NamedObject
	id::String
	parent::Node
	node::Node
end

println(typeof(NamedObject))
println(typeof(Node))
println(typeof(Keyword))
println(typeof(Keyword{:Symbol}))
println(typeof(Synonym))
println(typeof(Antonym))
println(VERSION)

