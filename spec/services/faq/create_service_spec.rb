require_relative './../../spec_helper.rb'

describe FaqModule::CreateService do

  before do
    @company = create(:company)

    @question = Faker::SiliconValley.invention
    @answer = Faker::SiliconValley.quote
    @hashtags = "#{Faker::StarTrek.specie}, #{Faker::StarTrek.specie}"
  end

  describe "#call" do

    it 'Without hashtag params, will receive an error' do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer.original" => @answer})

      response = @createService.call
      expect(response).to match("Hashtag Obrigatória")
    end
  end

end
