mod Test {
    struct Point {
        x: u16,
        y: u128,
    }
}

enum TrafficLight { Green, Red, Orange }

    
struct NamedObject {
    id: String,
    desc: String,
}

fn main() {
    println!("{}", TrafficLight::Green.into());
}


