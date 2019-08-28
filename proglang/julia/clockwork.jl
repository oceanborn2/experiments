# initial sample code from https://github.com/malmaud/Clockwork.jl

# broken test? lib?

using Test
using Clockwork

struct CompletedTask
    duration::AbstractString
    clock::Clock
    function CompletedTask(dur::AbstractString) 
    begin
        duration = dur
        #let cl = Clock(duration)
    end
end
end


println("Entering test after precompilation")

@test 🕟 == Clock("3:30")
@test 🕝 == Clock("1:30")

println("🕝-🕝=", 🕝-🕝)
#println("🕟=", Clock("3:30"))
#println("🕝=", Clock("1:30"))

#@test 🕟+🕝== 🕔 # 3:30 + 1:30 == 5:00

#@test 🕑^50 == 🕓
#@test Clock("3:30") == 🕟


let cp = Dates.Hour(3) + Dates.Minute(30)
  @test Clock(cp) == 🕟
  @test Dates.CompoundPeriod(🕟) == cp
end

#hooks_nightmare = rand(Clock,10,10)
#println(hooks_nightmare)

