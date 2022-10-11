require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  let (:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}

  let (:turn1) {Turn.new("Juneau", card1)}

  it 'exists' do
    expect(turn1).to be_a(Turn)
  end

  it 'has a card' do
    expect(turn1.card).to eq(card1)
  end

  it 'has a guess' do
    expect(turn1.guess).to eq("Juneau")
  end

  it 'can determine if an answer is correct' do
    turn2 = Turn.new("Anchorage", card1)
    
    expect(turn1.correct?).to eq(true)
    expect(turn2.correct?).to eq(false)
  end

  it 'returns feedback after an answer is recieved' do
    turn2 = Turn.new("Anchorage", card1)
    
    expect(turn1.feedback).to eq("Correct!")
    expect(turn2.feedback).to eq("Incorrect!")
  end
end