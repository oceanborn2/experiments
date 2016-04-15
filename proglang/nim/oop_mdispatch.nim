type

  Vehicle = ref object of RootObj
    name*:string not nil # name has a default name?

  CarStanding = enum cheap, utility, family, luxury

  Car = ref object of Vehicle
    carStanding: CarStanding

  Truck = ref object of Vehicle
  Boat  = ref object of Vehicle
  Plane = ref object of Vehicle


method toString*(v:Vehicle):string =
  result = '(' & repr(v) & ')'

method collide*(a, b: Vehicle) {.inline.} =
  quit "to override!"


method collide*(a: Vehicle, b: Car) {.inline.} =
  echo "collision between " & a.toString & " and " & b.toString

method collide*(a: Car, b: Vehicle) {.inline.} =
  echo "collision occurred between " & a.toString & " and " & b.toString


method takeOff*(p:Plane) {.inline.}=
  echo "taking off " & p.toString

method land*(p:Plane) {.inline.}=
  echo "landing " & p.toString

method land*(p:Boat) {.inline.}=
  echo "landing " & p.toString


var car1, car2: Car
var truck:Truck

new car1
car1.name = "car1-manual-steering"

new car2
new truck


collide(car1, car2)
car1.collide(car2)
car2.collide(car1)


truck.collide(car2)
