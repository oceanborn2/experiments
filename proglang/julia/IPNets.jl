# v1.2.0 OK

# adapted from https://pkg.julialang.org//docs/IPNets/ouvCE/0.6.0/

using Test
using IPNets
using IPNets.IPv4

ip4 = IPNets.IPv4("1.2.3.4")            # create a standard IPv4 address
# @test ip"1.2.3.4"

ip4net = IPNets.IPv4Net("1.2.3.0/24")
#IPv4Net("1.2.3.0/24")

println("ip4 in ip4net:", ip4 in ip4net)
println("length(ip4net):", length(ip4net))


