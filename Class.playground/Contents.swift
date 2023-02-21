
// Classes - reference type



class Chessman {
    
    //тип шахматной фигуры
    enum ChessmanType {
        case king, castle, bishop, pawn, knight, quenn
    }
    // цвета фигур
    enum ChessmanColor {
        case black, white
    }
    
    //тип фигуры
    let type: ChessmanType
    // цвет фигуры
    let color: ChessmanColor
    //координаты фигуры
    var coordinates: (String, Int)? = nil
    // символ, соответствующий фигуре
    let figureSymbol: Character
    
    //инициализатор создания фигуры
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
    }
    //второй инициализатор, который принимает координаты фигуры
    init(type:ChessmanType, color: ChessmanColor, figure: Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        figureSymbol = figure
        setCoordinates(char: coordinates.0, num: coordinates.1) //так как код утсановки координат уже написан в методе setCoordinates, то во избежание дублирования в инициализаторе этот метод просто вызывается
    }
    
    //установка координат
    func setCoordinates(char c: String, num n: Int) {
       setCoordinates(char: c, num: n)
    }
    //взятие фигуры
    func kill() {
        coordinates = nil
    }
}

//создаем экземпляр фигуры
var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")
kingWhite.setCoordinates(char: "E", num: 1)

var queenBlack = Chessman(type: .quenn, color: .black, figure: "\u{2655}", coordinates: ("A", 6))


//ссылка на вложенные типы
let linkToEnumValue = Chessman.ChessmanType.bishop

