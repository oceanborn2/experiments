# typealias now removed from Julia
# typealias Str AbstractString 




const Str = AbstractString

struct NamedObject
    id::Str
    name::String
end

function run()
    n = NamedObject("a", "b")
    println(n)
    println(n.id, n.name)
end

run()


