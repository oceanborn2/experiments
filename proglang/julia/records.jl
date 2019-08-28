abstract type Point end

struct Point2D <: Point
  x::Float64
  y::Float64
end

struct Point3D <: Point
  x::Float64
  y::Float64
  z::Float64
end


function showPoint(p::Point)
    println("x:", p.x, " y", p.y)
end

abstract type Shape end
abstract Line <: Shape  end
abstract Polygon <: Shape end
abstract Square <: Polygon end

const Str = AbstractString

struct NamedObject
  id::Str
  name::Str
end

a=Point2D(1.0,2.0)
showPoint(a)
