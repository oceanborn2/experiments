# initial sample from https://github.com/dcjones/Compose.jl

using Compose
using Test


# broken

function sierpinski(n)
    if n == 0
        compose(context(), polygon([(1,1), (0,1), (1/2, 0)]))
    else
        t = sierpinski(n - 1)
        compose(context(),
                (context(1/4,   0, 1/2, 1/2), t),
                (context(  0, 1/2, 1/2, 1/2), t),
                (context(1/2, 1/2, 1/2, 1/2), t))
    end
end

function squareroot(n)
    if (n>0)
        na = [i for i in 1:n] # 1.0:n to get floats - former code was based on integers
        println(na)
        println("type: ", typeof(na))
        t =  [sqrt(i) for i in 1:n] #sqrt(na)
        println(t)
        compose(context(), text(1,1,"*"), t)
    end
end

img = SVG("sierpinski.svg", 4inch, 4(sqrt(3)/2)inch)
draw(img, compose(sierpinski(8), linewidth(0.1mm), fill(nothing), stroke("black")))

img = SVG("sqrt.svg", 4inch, 4(sqrt(3)/2)inch)
draw(img, compose(squareroot(80), linewidth(0.2mm), fill(nothing), stroke("blue")))

