require 'ruby2d'

set title: 'Chess Square', background: 'black', width: 1600, height: 900
set resizable: true
x = true
white = Square.new(color: 'white', x: 1200, y: 500, size: 200, z:1)
black = Square.new(color: 'white', x: 1200, y: 200, size: 200, z:1)
whitetext = Text.new("White", color: 'black', x: 1200, y: 550, size: 75, z: 2)
blacktext = Text.new("Black", color: 'black', x: 1200, y: 550, size: 75, z: 2)

whitesquare = ["B1", "D1", "F1", "H1",
                "A2", "C2", "E2", "G2",
                "B3", "D3", "F3", "H3",
                "A4", "C4", "E4", "G4",
                "B5", "D5", "F5", "H5",
                "A6", "C6", "E6", "G6",
                "B7", "D7", "F7", "H7",
                "A8", "C8", "E8", "G8"]

blacksquare = ["A1", "C1", "E1", "G1",
                "B2", "D2", "F2", "H2",
                "A3", "C3", "E3", "G3",
                "B4", "D4", "F4", "H4",
                "A5", "C5", "E5", "G5",
                "B6", "D6", "F6", "H6",
                "A7", "C7", "E7", "G7",
                "B8", "D8", "F8", "H8"]

square= Square.new(
    x: 550, y: 200, z: 1,
    size: 500,
    color: 'white'
)

exit = Square.new(color: 'white', z:1)

text = Text.new('Start', x: 575, y: 325, z: 2, color: 'black', size: 200)
textexit = Text.new('Exit', color: 'black', size: 50, x: 5, y: 20, z: 2)

letnum = ""

on :mouse_down do |event|
    if square.contains?(event.x, event.y)
        clear
        square.add
        exit.add
        textexit.add
        white = Square.new(color: 'white', x:1200, y:500, size: 200, z: 1)
        black = Square.new(color: 'white', x:1200, y:500, size: 200, z: 1)
        whitetext.add
        blacktext.add
        num = rand(1..8).to_s
        let = ('a'..'h').to_a[rand(8)].capitalize
        letnum = let + num
        pos = Text.new(letnum, x: 575, y: 325, z: 2, color: 'black', size: 200)
    end

    if white.contains?(event.x, event.y)
        if whitesquares.include?(letnum)
            white = Square.new(color: 'green', x:1200, y:500, size: 200, z:1)
        else
            white = Square.new(color: 'red', x:1200, y:500, size: 200, z:1)
        end
    end

    if black.contains?(event.x, event.y)
        if blacksquares.include?(letnum)
            black = Square.new(color: 'green', x:1200, y:200, size: 200, z:1)
        else
            black = Square.new(color: 'red', x:1200, y:200, size: 200, z:1)
        end
    end

    if exit.contains?(event.x, event.y)
        close
    end
end


show