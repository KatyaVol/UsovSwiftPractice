
//: Structures (Value Type)
// Обьявим структуру, которая будет описывать сущность "игрок в шахматы"
//struct ChessPlayer {}

// У нас появился новый тип данных ChessPlayer. Пока он не имеет никакой практической ценности, у него нет свойств и методов. Но можно обьявить новый параметр данного типа и проинициализировать ему значение:
//let playerOleg = ChessPlayer() //
//type(of: playerOleg)


// Свойства в структурах
struct ChessPlayer {
    var name: String
    var victories: UInt
}
// структуры, как и перечисления, имеют встроенный инициализатор (метод с именем init), который не требуется обьявлять
var playerHarry = ChessPlayer(name: "Harry Potter", victories: 32)

// Значения свойств по умолчанию
struct PlayerInChess {
    var name: String
    var victories: UInt = 0
}
var player = PlayerInChess(name: "Bob")
player

// Пример создания параметров типа ChessPlayers с передачей значения свойств и без нее
struct ChessPlayers {
    var name: String = "Player who is unknown"
    var victories: UInt = 66
}

var unknownPlayer = ChessPlayers() // без передачи значения свойств
var playerTom = ChessPlayers(name: "Tom", victories: 3) // с передачей (нужно нажать option+enter

unknownPlayer.name
unknownPlayer.victories
unknownPlayer.victories += 1 //Данный способ доступа обеспечивает не только чтение, но и изменения значения свойства
unknownPlayer.victories

playerTom.name
playerTom.victories

//Собственные инициализаторы
struct ChessPlayer2 {
    var name: String = "Player Number ..."
    var victories: UInt = 0
    init(name: String){
        self.name = name
    }
}
var playerGrisha = ChessPlayer2(name: "Grinya")
playerGrisha.victories
//var newPlayer = ChessPlayer2() -  а этот код вызовет ошибку, так как структура больше не имеет встроенных инициализаторов

//Методы в структурах
struct ChessPlayerThirdRate {
    var name: String = "Player"
    var victories: UInt = 0
    init(name: String){
        self.name = name
    }
    func description() {
        print("Player \(name) has \(victories) victories")
    }
}
var ekaterina = ChessPlayerThirdRate(name: "Katya")
ekaterina.description()


//Mutating - Изменяющие методы изменяют значения свойств, обьявленные в тех же структурах
struct ChessPlayerFourthRate {
    var name: String = "Player"
    var victories:  UInt = 0
    init(name: String){
        self.name = name
    }
    func description() {
        print("Player \(name) has \(victories) victories")
    }
    mutating func addVictories( count: UInt = 1){
        victories += count
    }
}
var dima = ChessPlayerFourthRate(name: "Dimon")
dima.victories
dima.addVictories()
dima.victories
dima.addVictories(count: 3)
dima.victories
dima.description()
