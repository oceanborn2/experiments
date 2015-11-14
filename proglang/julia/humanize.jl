using Humanize
using Base.Test

@test datasize(3000000) == "3.0 MB"
@test datasize(3000000, style=:bin, format="%.3f") == "2.861 MiB"
@test datasize(3000000, style=:gnu, format="%.3f") == "2.861M"


macro displayTest(tf, exp::AbstractString) 
    println("testing: ", dump(tf))
    @test tf() == exp
end

let f=function(n::Int16)
        timedelta(n)
    end
end

println("f:$(typeof(f))")

displayTest(f, "a minute")
    
    
@test timedelta(70) == "a minute"
@test timedelta(0,0,0,23,50,50) == "23 hours"
@test timedelta(DateTime(2014,2,3,12,11,10) - 
                    DateTime(2013,3,7,13,1,20)) == "11 months"
                    
@test timedelta(Date(2014,3,7) - Date(2013,2,4)) == "1 year, 1 month"

