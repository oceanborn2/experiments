using JavaCall


JavaCall.init(["-Xmx512M", "-Djava.class.path=$(joinpath(Pkg.dir(), "JavaCall", "test"))", "-verbose:jni", "-verbose:gc"])

jlm = @jimport java.lang.Math
#JavaObject{:java.lang.Math} (constructor with 2 methods))

res = jcall(jlm, "sin", jdouble, (jdouble,), pi/2)
#1.0
println("res:$(res)")


# see http://aviks.github.io/JavaCall.jl/
jnu = @jimport java.net.URL
#JavaObject{:java.net.URL} (constructor with 2 methods)

gurl = jnu((JString,), "http://www.google.com")
#JavaObject{:java.net.URL}(Ptr{Void} @0x0000000108ae2aa8)

println(jcall(gurl, "getHost", JString,()))
#"www.google.com"

j_u_arrays = @jimport java.util.Arrays
#JavaObject{:java.util.Arrays} (constructor with 2 methods)

println(jcall(j_u_arrays, "binarySearch", jint, (Array{jint,1}, jint), [10,20,30,40,50,60], 40))
#3

#jlu=@jimport java.util.*
#prinln(jcall)
#println(jcall())