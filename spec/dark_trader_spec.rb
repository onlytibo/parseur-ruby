require_relative '../lib/dark_trader.rb'

# vérifier qu'il y a bien 2-3 cryptos clés dans le array de hash
describe "the function who check if main cryptos are there" do
  it "should be not nil" do
    expect(puts_symbols_in_array(pageAllCryptos)).not_to be_nil
  end
end

# vérifier qu'on retourne pas Nil pour le array de hash

# vérifier qu'il y a bien un nombre de valeur cohérente dans le array de hash

# vérifier qu'il n'y a pas de Nil dans chaque value des keys