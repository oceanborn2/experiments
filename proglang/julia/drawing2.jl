# initial sample from https://github.com/andrewcooke/Drawing.jl#examples

using ColorTypes
using Drawing


r1, r2, r3, n, w = 1, 1, 0.5, 600, 0.5
d1, d2, rotn = 400, -140, 40
sat, val, alpha = 0.7, 0.5, 0.1
width = 2*pi*r1 / n * w
with(Axes(centred=true),
           Translate(0.9, 0.9), Scale(3),
           Paper("black"),
           Pen(width; cap="round")) do
           for x in shuffle!([i / n for i in 1:n])
               hue = x * 360
               theta1 = deg2rad(rotn + x*360)
               theta2 = theta1 + deg2rad(d1)
               theta3 = theta1 + deg2rad(d2)
               draw(Ink(HSVA(hue, sat, val + (1-val)*rand(), alpha))) do
                   move(r1 * cos(-theta1), r1  * sin(-theta1))
                   line(r2 * cos(-theta2), r2  * sin(-theta2))
                   move(r1 * cos(-theta1), r1  * sin(-theta1))
                   line(r3 * cos(-theta3), r3  * sin(-theta3))
               end
           end
       end
       
       
       