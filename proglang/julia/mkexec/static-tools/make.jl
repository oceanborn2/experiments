import Pkg
#Pkg.generate("mkexec")

import StaticCompiler
import StaticTools

using StaticCompiler
using StaticTools

# see: https://juliahub.com/ui/Packages/General/StaticCompiler/

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

compile_executable(mymain, (), "./")



# Other links:
# https://stackoverflow.com/questions/64078701/how-to-add-dependencies-to-my-julia-package
