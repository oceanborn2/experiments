let square(x) = x * x;

let min(x,y) = if x < y then x else y;
let max(x,y) = if x < y then y else x;

let fact(n) = if n == 1 then 1 else n * fact(n-1);

let e = exp 1;
let e_n(n) = e^n;

let fib(n) = 
	if n==0 
		then 0
		else if n==1 then 1
		else fib(n-2)+fib(n-1);

let suiv (n) = n + 1;
let pred (n) = n - 1;

let add1(x,y) = x + y;

let add2 = \x -> (\y -> x + y);
let add2f = \x -> (\y -> x + y + 0.0);



--let digits(n) = reverse n;

Main = do
    putStrLn( fact(40));

