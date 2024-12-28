require_relative "../lib/game_manager"
describe GameManager do
  subject(:game_manager_test) { described_class.new }

  describe "#ask_for_move" do
    it "Returns the column given by user when it is correct" do
      allow(game_manager_test).to receive(:gets).and_return('7')
      expect(game_manager_test.ask_for_move).to eql(7)
    end
  end

  describe "#switch_player" do
    it "Change to player 2 when player is 1" do
      game_manager_test.instance_variable_set(:@turn, 1)
      turn = game_manager_test.instance_variable_get(:@turn)
      turn = game_manager_test.switch_player(turn)
      expect(turn).to eql(2)
    end
    it "Change to player 1 when player is 2" do
      game_manager_test.instance_variable_set(:@turn, 2)
      turn = game_manager_test.instance_variable_get(:@turn)
      turn = game_manager_test.switch_player(turn)
      expect(turn).to eql(1)
    end

  end
end
