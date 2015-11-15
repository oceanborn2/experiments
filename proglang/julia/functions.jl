<<<<<<< HEAD
function square(x::Number)
  x * x
end

function inverse(x::Number)
  1/x
end

function fib(n::Integer)
    if n<2
      1
    else
      res=fib(n-1)+fib(n-2)
    end
  end

@time begin
  for i=1:40
    fib(i)
  end
end

let x::Int128=0
@time begin
  for i=1:1000*1000
      inverse(2)
      inverse(3.14)
      square(10 + x % 7)
      square(3.2)
      sin(x % 100)
      x=x+1
    end
  end
  println("fin de boucle:", x / 1000000)
end

println(inverse(2))
println(inverse(3.14))
println(square(10))
println(square(3.2))
println(fib(10))
=======
const ϕ = golden


function square(x::num)
	x*x
end

function fib(n::integer)
	if (n<2) 
		1
	else
		fib(n-2)+fib(n-1)
	end
end

println("32^2=" * square(32))
println("square(32.1)=" *square(32.1))
println("square(ϕ)=" *square(ϕ))
>>>>>>> 3a6253de0044899ca36851129b00c70d00f69324
