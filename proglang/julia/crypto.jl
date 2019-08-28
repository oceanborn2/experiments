using Distributed
using Test

# naive crypto algos implementation

# Diffie Hellman authentication scheme
function authDH(a, b, g, p::BigInt)
    ga = g^a
    gb = g^b
    gab = mod(ga^b, p)
    gba = mod(gb^a, p)
    (gab, gba, a,b, ga, gb)
end

# Modular exponentiation
function modExp(v, n, p::BigInt)
    local nc = n
    local mult::BigInt = 1
    while (nc > 0)
        mult = mod(mult*v,p)
        nc -= 1 # dec(nc)
    end
    println(mult)
    mult
end

function modExpTest()::BigInt
    res = modExp(
        BigInt(17),
        BigInt(13),
        BigInt(7))
    return res
end

function authDHTest()
    let
        a = BigInt(1211)
        b = BigInt(461)

        # g and p are chosen randomly with the constraint that they are mutually prime
        g = BigInt(327)
        p = BigInt(15485993)
        (gab, gba, a1, b1, ga, gb) = authDH(a,b,g,p)
        println("a=", a)
        println("b=", b)
        println("g=", g)
        println("g^a=", ga)
        println("g^b=", gb)
    #	gap = mod(ga, p)
    #	println("gap = ", gap)

    #	gbp = mod(gb, p)
    #	println("gbp = ", gbp)

        println("gab:", gab)
        println("gba:", gba)
	    println("")
        println("")

        local nheads = @elapsed @distributed  (+)  for i=1:100
            1
        end

        # println("nheads1:", nheads)

        local nheadsp = @elapsed @distributed (+) for i=1:100
            (gab, gba, a2, b2, ga, gb) = authDH(a,b,g,p)
            if (gab == gba)
                1
            else
                0
            end
        end
    end
	@assert nheads == nheadsp
end

#@test authDHTest()
@test modExpTest()