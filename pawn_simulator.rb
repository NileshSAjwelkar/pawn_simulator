class PawnSimulator

	def initialize
		@x = nil
		@y = nil
		@facing = nil
		@color = nil
		@on_board = false
	end

	def process_commands(commands)
		commands.each do |command|
      puts "Command : #{command.upcase}"

			command_parts = command.split(" ")

			case command_parts[0].downcase
			when "place"
				place(command_parts[1], command_parts[2], command_parts[3], command_parts[4])
      when "move"
        move
      when "left"
        left
      when "right"
        right
      when "report"
        report
      end

      puts "Current position: (#{@x}, #{@y}) || Facing: #{@facing} || Color: #{@color}\n\n" if @on_board
		end
	end

	private
	
	def place(x, y, facing, color)
		if valid_position?(x, y) && valid_facing?(facing) && valid_color?(color)
      @x = x.to_i
      @y = y.to_i
      @facing = facing
      @color = color
      @on_board = true
    else  
    	puts "Coordinates out of board. Pawn not placed."
		end
	end

	def move
		if @on_board
			case @facing.downcase
			when "n"
				move_one_step_north
      when "s"
        move_one_step_south
      when "e"
        move_one_step_east
      when "w"
        move_one_step_west
      end
    else
			puts "Pawn not placed."
		end
	end

	def left
		if @on_board
			@facing = rotation[@facing.downcase]["left"].upcase
		else
			puts "Cannot rotate left. Pawn not placed."
		end
	end

	def right
		if @on_board
			@facing = rotation[@facing.downcase]["right"].upcase
		else	
			puts "Cannot rotate right. Pawn not placed."
		end
	end

  def move_one_step_north
    if @y < 7
      @y += 1
      @color = new_color
      puts "Moved North. Current position: (#{@x}, #{@y})"
    else
      puts "Cannot move North. Reached edge of the board."
    end
  end

  def move_one_step_south
    if @y > 0
      @y -= 1
      @color = new_color
      puts "Moved South. Current position: (#{@x}, #{@y})"
    else
      puts "Cannot move South. Reached edge of the board."
    end
  end

  def move_one_step_east
    if @x < 7
      @x += 1
      @color = new_color
      puts "Moved East. Current position: (#{@x}, #{@y})"
    else
      puts "Cannot move East. Reached edge of the board."
    end
  end

  def move_one_step_west
    if @x > 0
      @x -= 1
      @color = new_color
      puts "Moved West. Current position: (#{@x}, #{@y})"
    else
      puts "Cannot move West. Reached edge of the board."
    end
  end

  def report
    if @on_board
      puts "Current position: (#{@x}, #{@y})"
      puts "Current facing direction: #{@facing}"
      puts "Current color: #{@color}"
    else
      puts "Pawn has not been placed yet!"
    end
  end

	def rotation
		{
			"n" => {"left" => "w", "right" => "e"},
			"e" => {"left" => "n", "right" => "s" },
			"s" => {"left" => "e", "right" => "w"},
			"w" => {"left" => "s", "right" => "n"}
		}
	end

	def valid_position?(x, y)
		x.to_i.between?(0, 7) && y.to_i.between?(0, 7)
	end

  def valid_facing?(facing)
    ["n", "s", "e", "w"].include?(facing.downcase)
  end

  def valid_color?(color)
    valid_colors.include?(color.downcase)
  end

  def valid_colors
		["black", "white"]
  end

  def new_color
		(valid_colors - [@color]).first
  end
end

# Usage example:
simulator = PawnSimulator.new
commands = ["PLACE 2 3 N White", "MOVE", "LEFT", "MOVE", "RIGHT", "MOVE", "REPORT"]
simulator.process_commands(commands)

