abstract Point

function showPoint(p::Point)
    println("x:", p.x, " y", p.y)
end

immutable Point2D <: Point
  x::Float64
  y::Float64
end

immutable Point3D <: Point
  x::Float64
  y::Float64
  z::Float64
end

abstract Shape
abstract Line    <: Shape
abstract Polygon <: Shape
abstract Square  <: Polygon

typealias Str AbstractString

type NamedObject
  id::Str
  name::Str
end

a=Point2D(1.0,2.0)
showPoint(a)
