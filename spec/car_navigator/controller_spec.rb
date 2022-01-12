RSpec.describe CarNavigator::Controller do
  context 'when given a valid input' do
    let(:upper_coordinates) { '5 5' }
    let(:car1) { ['1 2 N', 'LMLMLMLMM'] }
    let(:car2) { ['3 3 E', 'MMRMMRMRRM'] }
    let(:expected_result) { ['1 3 N', '1 1 E'] }

    it 'returns the final coordinates and heading of each car' do
      navigator = CarNavigator::Controller.new(upper_coordinates, car1, car2)
      results = navigator.run
      expect(results).to eq(expected_result)
    end
  end

  context 'when given an invalid upper-right coordinates' do
    let(:upper_coordinates) { '5' }
    let(:car1) { ['1 2 N', 'LMLMLMLMM'] }
    let(:car2) { ['3 3 E', 'MMRMMRMRRM'] }

    it 'raises an InvalidInputError' do
      navigator = CarNavigator::Controller.new(upper_coordinates, car1, car2)
      expect { navigator.run }.to raise_error(
                                    CarNavigator::InvalidInputError,
                                         /Invalid upper coordinates!/
                                       )
    end
  end

  context 'when given an invalid car coordinates' do
    let(:upper_coordinates) { '5 5' }
    let(:car1) { ['1', 'LMLMLMLMM'] }
    let(:car2) { ['3 3 E', 'MMRMMRMRRM'] }

    it 'raises an InvalidInputError' do
      navigator = CarNavigator::Controller.new(upper_coordinates, car1, car2)
      expect { navigator.run }.to raise_error(
                                    CarNavigator::InvalidInputError,
                                    /Invalid car coordinates!/
                                  )
    end
  end

  context 'when given an invalid car orientation' do
    let(:upper_coordinates) { '5 5' }
    let(:car1) { ['1 2 N', ''] }
    let(:car2) { ['3 3 E', 'MMRMMRMRRM'] }

    it 'raises an InvalidInputError' do
      navigator = CarNavigator::Controller.new(upper_coordinates, car1, car2)
      expect { navigator.run }.to raise_error(
                                    CarNavigator::InvalidInputError,
                                    /Invalid car orientation!/
                                  )
    end
  end
end
