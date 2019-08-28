#=
regexes.jl:
- Julia version: 1.2.0
- Author: Pascal
- Date: 2019-08-25
=#

using Distributed
using Test

function runRegex(re::Regex, s::String, n::UInt=100)
    for i in 1:n
        local res = match(re, s)
    end
end


@test
runRegex(r"[A-Z]", 100, "test")

@test
runRegex(r"[A-Z]+", "TEST")
