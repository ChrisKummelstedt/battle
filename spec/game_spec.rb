require 'game'

describe Game do

  let(:slasher) {double :slasher, name: nil}
  let(:mittens) {double :mittens, name: nil}
  let(:winner) {double :winner, hp: 1, name: nil}
  let(:looser) {double :looser, hp: 0, name: nil}
  subject(:game) {described_class.new slasher, mittens, "true"}
  subject(:game_over) {described_class.new winner, looser, "true"}
  subject(:sp_game) {described_class.new slasher, mittens, "false"}

  it "initalizes with two fighter instances" do
      expect(game.player_1).to eq slasher
      expect(game.player_2).to eq mittens
  end


  it "takes damage" do
    expect(mittens).to receive(:receive_damage)
    game.attack(mittens)
  end

  it 'switches turn' do
    game.switch_turn
    expect(game.current_player).to eq mittens
    expect(game.opponent).to eq slasher
  end

  it 'knows when the game is over' do
    expect(game_over.game_over?).to eq true
  end

  it 'knows the game type' do
    allow(mittens).to receive(:name=).and_return("Mittens")
    expect(sp_game.game_type).to eq false
  end


end
