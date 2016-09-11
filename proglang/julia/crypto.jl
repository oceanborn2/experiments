using Base.Test

# naive crypto algos implementation

# Diffie Hellman authentication scheme
function authDH(a,b,g,p::BigInt)
    ga = g^a
    gb = g^b
    gab = mod(ga^b, p)
    gba = mod(gb^a, p)
    (gab, gba, a,b, ga, gb)
end

# Modular exponentiation
function modExp(v,n,p::BigInt)
	local nc = n
	local mult::BigInt=1
	while (nc>0)
		mult = mod(mult*v,p)
		dec(nc)
	end
	mult
end

function modExpTest()
	modExp(17,13,7)
end


function authDHTest()
	let 
		a=BigInt(1211) 
		b=BigInt(461)
		
		# g and p are chosen randomly with the constraint that they are mutually prime
		g=BigInt(327)
		p=BigInt(15485993)

		(gab, gba, a1, b1, ga, gb) = authDH(a, b, g, p)

		println("a=", a)
		println("b=", b)
		println("g=", g)

		println("g^a=", ga)
		println("")
		println("g^b=", gb)
		println("")
		println("")

	#	gap = mod(ga, p)
	#	println("gap = ", gap)

	#	gbp = mod(gb, p)
	#	println("gbp = ", gbp)
		
		println("gab:", gab)
		println("gba:", gba)

		nheads=@time @parallel (+)  for i=1:100
		 	1	  
		end
		# println("nheads1:", nheads)

		nheads=@time @parallel (+) for i=1:100
			(gab, gba, a2, b2, ga, gb) = authDH(a,b,g,p)	  
			if (gab == gba)
				1
			else
				0
			end
		end
	end
end

# @test authDHTest()

modExpTest()