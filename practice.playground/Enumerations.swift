import UIKit

// ENUMERATIONS

//enum CurrencyUnit {
//    case rouble
//    case euro
//    case dollar
//}
// CurrencyUnit - имя перечисления
// rouble - значение





enum CurrencyUnit {
    case rouble, euro, dollar
}

// newUnit - имя параметра
// Пример полного синтаксиса
var newUnit = CurrencyUnit.rouble


// Краткий синтаксис
var newUnit1: CurrencyUnit = .dollar
var newUnitTwo: CurrencyUnit = .euro

newUnitTwo = .dollar
newUnit1 = .euro

newUnit1
newUnitTwo

// Associated Value

// страны, использующие доллар

    
enum AdvancedCurrencyUnit {
    enum DollarCountries {
        case usa
        case canada
        case australia   // Вложенное перечисление
    }
    case rouble(countries: [String], shortName: String) //2 ассоциированных  параметра =
    case euro (countries: [String], shortName: String) // = ассоциированное значение
    case dollar(nation: DollarCountries, shortName: String)
}

let euroCurrency: AdvancedCurrencyUnit = .euro(countries: ["Germany", "France", "Austria"], shortName: "EUR")
var dollarCurrency: AdvancedCurrencyUnit = .dollar(nation: .usa, shortName: "USD")
var australia: AdvancedCurrencyUnit.DollarCountries = .australia

//Оператор SWITCH для перечислений
switch dollarCurrency {
case .rouble:
    print("Рубль")
case let.euro(countries, shortName):
    print("Евро. Страны: \(countries). Краткое наименование:\(shortName)")
case .dollar(let nation, let shortName):
    print("Доллар \(nation). Краткое наименование:\(shortName)")
}

// Raw Value или Связанные/Исходные/Сырые значения
enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    var description: String {return self.rawValue} // вычисляемое свойство, должно быть обьявлено как var.
    
    func about() {
        print("Перечисление содержит список смайликов")
    }
    func descriptionValue() -> Smile {
        return self
    }
    func descriptionRawValue() -> String {
        return rawValue
    }
}
let mySmile: Smile = .sorrow
mySmile.description


var otherSmile = Smile.joy
otherSmile.about()
otherSmile.descriptionValue()
otherSmile.descriptionRawValue()

let iAmHappy = Smile.sorrow
iAmHappy.rawValue


enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto = 999
}
let myPlanet = Planet.init(rawValue: 2)
var anotherPlanet = Planet.init(rawValue: 3)
var unknownPlanet = Planet(rawValue: 66)
