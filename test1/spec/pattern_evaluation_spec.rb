require "pattern_evaluation"

RSpec.describe Evaluation do
	context "Initializing class " do
		describe 'empty initialization' do
			it 'with empty parameter' do
				expect{Evaluation.new}.to raise_error(ArgumentError)
			end
		end
  end
	context "method pattern_evaluation " do
		describe 'initialization with nil' do
			it 'with empty parameter' do
				expect(Evaluation.new(nil).pattern_evaluation).to eq("Please provide pattern")
			end
		end
		describe 'initialization with right pattern string return evaluation' do
			it 'with exact string' do
				expect(Evaluation.new("13+62*7+*").pattern_evaluation).to eq(76)
			end
		end
		describe 'initialization with non mathiching pattern' do
			it 'failure string' do
				expect(Evaluation.new("13+62*+*").pattern_evaluation).to eq(-1)
			end
		end
	end
end