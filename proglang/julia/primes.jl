function digitsum(num::Integer)
	#digits = num.collect(ion)
end


function isprime(num::Integer) 
	for i=1:sqrt(num)
		if num % i==0
			return false
		end
	end
	1
end