require 'ruby2d'

set background: 'black'
# speed
set fps_cap: 20

# width = 640 / 20 = 32
# height = 480 / 20 = 24

SQUARE_SIZE = 20
GRID_WIDTH = Window.width / SQUARE_SIZE
GRID_HEIGHT = Window.height / SQUARE_SIZE

# snake coordinations of where it will be starting
class Snake
  attr_writer :direction

  # snake object itself positioning
  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2 ,3]]
    @direction = 'down'
    @growing = false
  end

    # snake object itself
    # dot creation
def draw
    @positions.each do |position|
      Square.new(x: position[0] * SQUARE_SIZE, y: position[1] * SQUARE_SIZE, size: SQUARE_SIZE - 1, color: 'white')
    end
  end

  # growth function starter with move function
  def grow
    @growing = true
  end

  def move
    if !@growing
      @positions.shift
    end

    @positions.push(next_position)
    @growing = false
  end

  # controls with arrows keys
  def can_change_direction_to?(new_direction)
    case @direction
    when 'up' then new_direction != 'down'
    when 'down' then new_direction != 'up'
    when 'left' then new_direction != 'right'
    when 'right' then new_direction != 'left'
    end
  end

  def x
    head[0]
  end

  def y
    head[1]
  end

  def next_position
    if @direction == 'down'
      new_coords(head[0], head[1] + 1)
    elsif @direction == 'up'
      new_coords(head[0], head[1] - 1)
    elsif @direction == 'left'
      new_coords(head[0] - 1, head[1])
    elsif @direction == 'right'
      new_coords(head[0] + 1, head[1])
    end
  end

  def hit_itself?
    @positions.uniq.length != @positions.length
  end

  private

  def new_coords(x, y)
    [x % GRID_WIDTH, y % GRID_HEIGHT]
  end

  def head
    @positions.last
  end
end

class Game
  def initialize
    @ball_x = 10
    @ball_y = 10
    @score = 0
    @finished = false
  end

  # score board
  def draw
    Square.new(x: @ball_x * SQUARE_SIZE, y: @ball_y * SQUARE_SIZE, size: SQUARE_SIZE, color: 'red')
    Text.new(text_message, color: 'white', x: 10, y: 10, size: 25, z: 1)
  end

  def snake_hit_ball?(x, y)
    @ball_x == x && @ball_y == y
  end

  def record_hit
    @score += 1
    @ball_x = rand(Window.width / SQUARE_SIZE)
    @ball_y = rand(Window.height / SQUARE_SIZE)
  end

  def finish
    @finished = true
  end

  def finished?
    @finished
  end

  private

  # game over message when user hits itself
  def text_message
    if finished?
      "Game over, Your Score was #{@score}. Press 'R' to restart. "
    else
      "Score: #{@score}"
    end
  end
end

# refresh
# calling all functions
snake = Snake.new
game = Game.new

update do
  clear

  unless game.finished?
    snake.move
  end

  snake.draw
  game.draw

  # when snake hits into ball/food
  if game.snake_hit_ball?(snake.x, snake.y)
    game.record_hit
    snake.grow
  end

  if snake.hit_itself?
    game.finish
  end
end

# direction and snake can do different things with increments with def move
# checks direction so snake cant go left and right or up and down
# cant go left if going right. cant go up if going down. checks. vice versa
on :key_down do |event|
  if ['up', 'down', 'left', 'right'].include?(event.key)
    if snake.can_change_direction_to?(event.key)
      snake.direction = event.key
    end
  end
# r for restart: calling function
  if game.finished? && event.key == 'r'
    snake = Snake.new
    game = Game.new
  end
end

show

# order of code important, kinda