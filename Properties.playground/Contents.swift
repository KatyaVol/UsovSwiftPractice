// Properties

class Person {
    var firstName = "Name"
    var secondName = "Surname"
    lazy var wholeName: String = self.generateWholeName() // ленивое свойство
    
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
    func generateWholeName() -> String {
        return firstName + " " + secondName
    }
}
var me = Person(name: "Katya", secondName: "Volobueva")

me.wholeName
me.generateWholeName()
me.secondName = "Ivanova" //несмотря на то, что значение свойства secondName было изменено, значение ленивого свойства осталось тем же
me.wholeName //ленивые свойства вычиляются однажды и больше не меняют свое значение
me.generateWholeName()

class Person1 {
    var firstName = "Name"
    var secondName = "Surname"
    lazy var wholeName: () -> String = { "\(self.firstName) \(self.secondName)"} //ленивое свойство функционального, хранящее в себе замыкание
    
    init(name: String, secondName: String){
        (self.firstName, self.secondName) = (name, secondName)
    }
}
var otherMan = Person1(name: "Dima", secondName: "Volobuev")
otherMan.wholeName() //!!! так как свойство в себе хранит замыкание, доступ к нему необходимо организовать с исользованием скобок
otherMan.secondName = "Ivanov"
otherMan.wholeName()


// Вычисляемые свойства

class Person2 {
    var firstName = "Name"
    var secondName = "Surname"
    var wholeName: String {return "\(self.firstName) \(self.secondName)"} // вычисляемое свойство
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
}
var otherMan2 = Person2(name: "Grigory", secondName: "Volobuev")
otherMan2.firstName
otherMan2.secondName
otherMan2.wholeName
otherMan2.secondName = "Ivanov"
otherMan2.wholeName


// Контроль значений свойств
// Геттер и сеттер (для вычисляемых свойств) - WillSet & DidSet (наблюдатели для хранимых свойств)


struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        willSet (newValueOfRadius) {
            print("Вместо значениия \(radius) будет установлено значение \(newValueOfRadius)")
        }
        didSet (oldValueOfRadius) {
            print("Значение \(oldValueOfRadius) изменено на \(radius)")
            
        }
    }
    var perimeter: Float {
        get {
            return 2 * 3.14 * radius
        }
        set (newPerimeter) {
            radius = newPerimeter / (2 * 3.14)
        }
    }
}
var myNewCircle = Circle(coordinates: (x: 0, y: 0), radius: 10)
myNewCircle.perimeter
myNewCircle.perimeter = 31.4
myNewCircle.radius



struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if volume > AudioChannel.maxVolume {
                volume = AudioChannel.maxVolume
            }
        }
    }
}
var leftChannel = AudioChannel(volume: 2)
var rightChannel = AudioChannel(volume: 3)
rightChannel.volume = 6
rightChannel.volume

AudioChannel.maxVolume
AudioChannel.maxVolume = 10
AudioChannel.maxVolume
rightChannel.volume = 8
rightChannel.volume
