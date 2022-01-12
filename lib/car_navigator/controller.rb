module CarNavigator
  class Controller
    def initialize(upper_coordinates, car1, car2)
      @upper_coordinates = upper_coordinates
      @instructions = [car1, car2]
    end

    def run
      create_grid

      results = []
      @instructions.each do |instruction|
        results.push(navigate(instruction[0], instruction[1]))
      end
      results
    end

    private

      def create_grid
        width, height = @upper_coordinates.split(' ')
        if width.nil? || height.nil?
          raise CarNavigator::InvalidInputError, "Invalid upper coordinates!"
        end

        @grid = Array.new(width.to_i) {Array.new(height.to_i, 0)}
      end

      def navigate(coordinates, initial_orientation)
        start = coordinates.split(' ')
        if start.length < 3
          raise CarNavigator::InvalidInputError, "Invalid car coordinates!"
        end

        steps = initial_orientation.chars
        if steps.length == 0
          raise CarNavigator::InvalidInputError, "Invalid car orientation!"
        end

        x, y, orientation = start[0].to_i, start[1].to_i, start[2]
        @grid[x][y] = orientation

        steps.each do |step|
          new_orientation = orientation

          case step
          when "M"
            @grid[x][y] = 0

            new_x = x
            new_x = x + 1 if orientation == 'W'
            new_x = x - 1 if orientation == 'E'

            new_y = y
            new_y = y + 1 if orientation == 'N'
            new_y = y - 1 if orientation == 'S'

            x, y = new_x, new_y
            @grid[x][y] = orientation
          when "L"
            new_orientation = 'W' if orientation == 'N'
            new_orientation = 'E' if orientation == 'S'

            new_orientation = 'S' if orientation == 'W'
            new_orientation = 'N' if orientation == 'E'

            orientation = new_orientation
          else # "R"
            new_orientation = 'E' if orientation == 'N'
            new_orientation = 'W' if orientation == 'S'

            new_orientation = 'N' if orientation == 'W'
            new_orientation = 'S' if orientation == 'E'

            orientation = new_orientation
          end
        end
        "#{x} #{y} #{orientation}"
      end

      def print_grid
        @grid.each do |r|
          f = r[0]
          print f
          print " | "
          r.shift
          print r.join(" ")
          r.unshift(f)
          puts
        end
      end
  end
end
