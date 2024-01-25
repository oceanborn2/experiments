import Pkg
#Pkg.generate("mkexec")

import PackageCompiler
using PackageCompiler

# see: https://julialang.github.io/PackageCompiler.jl/dev/sysimages.html#Creating-a-sysimage-using-PackageCompiler

# struct S
# 	s::String
# end

hello(s::String) = println("Hello ", s)

#hello(s::S) = println("Hello ", S.s)

function mymain()
	println("mkexec main")
	println(hello("Pascal"))
	return 0
end

create_sysimage(["Example"]; sysimage_path="ExampleSysimage.so")


compile_executable(mymain, (), "./")



# Other links:
# https://stackoverflow.com/questions/64078701/how-to-add-dependencies-to-my-julia-package
