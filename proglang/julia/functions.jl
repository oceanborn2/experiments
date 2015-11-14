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
