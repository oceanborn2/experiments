type

  Vehicle = ref object of RootObj
    name*:string not nil # name has a default name?

  CarStanding = enum cheap, utility, family, luxury

  Car = ref object of Vehicle
    carStanding: CarStanding

  Truck = ref object of Vehicle
  Boat  = ref object of Vehicle
  Plane = ref object of Vehicle


method toString*(v:Vehicle):string {.base.} =
  result = '(' & repr(v) & ')'

method collide*(a, b: Vehicle) {.base.} =
  quit "to override!"


method collide*(a: Vehicle, b: Car) {.inline.} =
  echo "*1 - collision between " & a.toString & " and " & b.toString

method collide*(a: Car, b: Vehicle) {.inline.} =
  echo "*2 - collision occurred between " & a.toString & " and " & b.toString


method takeOff*(p:Plane) {.base.}=
  echo "taking off " & p.toString

method land*(p:Vehicle) {.base.}=
  echo "landing a vehicle: " & p.toString

method land*(p:Plane) {.inline.}=
  echo "landing plane " & p.toString

method land*(p:Boat) {.inline.}=
  echo "landing boat " & p.toString


var o1: Boat
new o1
o1.name = "Boat"

var o2: Plane
new o2
o2.name = "Plane"

o1.land()
o2.land()

var car1, car2: Car
var truck:Truck

new car1
car1.name = "car1-manual-steering"
car1.land()

new car2
new truck


collide(car1, car2)
car1.collide(car2)
car2.collide(car1)


truck.collide(car2)
