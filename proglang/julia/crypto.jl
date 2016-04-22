# sample diffie-hellman implementation (naive)


function authDH(a::BigInt, b::BigInt, g::BigInt, p::BigInt)
    ga = g^a
    gb = g^b

    gab = mod(ga^b, p)
    gba = mod(gb^a, p)
    
    (gab, gba, a,b, ga, gb)
end

    

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

	# nheads=@parallel (+)  for i=1:1000_000_000_000_000_000
	# 	1	  
	# end
	# println("nheads1:", nheads)

	nheads=@parallel (+) for i=1:1000_000
		(gab, gba, a2, b2, ga, gb) = authDH(a,b,g,p)	  
		if (gab == gba) 
			1
		else
			0
		end
	end

	println("sumOK", nheads)

end


