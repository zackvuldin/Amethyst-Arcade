require 'ruby2d'

# setup
set title: 'BOOM BOOM POW'
set background: 'black'
set width: 1200
set height: 800

# squares that will be appearing all over. random colors for each
# setup for squares/boxes
class Box
    def initialize
        @y = 
        rand(Window.height)
        @x = 
        rand(Window.width)
        @y_velocity = 
            (-5..5).to_a.sample
        @x_velocity = 
            (-5..5).to_a.sample
        @color = Color.new('random')
        @size = (8..25).to_a.sample
    end

# detail on the squares being made being implemented
# @square function for Square
def draw
    @square = Square.new(x: @x, y: @y, size: @size, color: @color)
end

# movement with velocity as speed
def move
    @x = (@x + @x_velocity) % Window.width
    @y = (@y + @y_velocity) % Window.height
end

# checks conditions
def check_for_collisions
    if @square && collision_detected?
        @x_velocity = -@x_velocity
        @y_velocity = -@y_velocity
end
end

# collision detected method
# asks other boxes if they include/contain the current box inside
# also checks if they have collided
def collision_detected?
    ($boxes - Array(self)).any? do |other_box|
        # .include method with other_square
        other_box.include?(@square)
    end
end

# comparing squares
# bruh, squares so much easier than circles. 3D EVEN harder
# gotta user different formulas for circles
# not .include, its .contains
def include?(other_square)
    # top left
    @square.contains?(other_square.x1, other_square.y1) || 
    # top right
    @square.contains?(other_square.x1, other_square.y2) || 
    # bottom right
    @square.contains?(other_square.x1, other_square.y3) || 
    # bottom left
    @square.contains?(other_square.x1, other_square.y4) 
end
end

# amount of new squares being created in window
$boxes = Array.new(50) { Box.new }

# calling all functions
# calling functions in a certain order matters
update do
    clear
    $boxes.each do
         |box|
        box.check_for_collisions
        box.move
        box.draw
    end
end

show

# seriously though, circles are so much harder. WHY!?!