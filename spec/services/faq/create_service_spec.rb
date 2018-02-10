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
      @createService = FaqModule::CreateService.new({question: @question, answer: @answer})

      response = @createService.call
      expect(response).to match("Hashtag is mandatory")
    end

    it 'With valid params, receive success message' do
      @createService = FaqModule::CreateService.new({question: @question, answer: @answer, hashtag: @hashtags})

      response = @createService.call
      expect(response).to match("Successfully created")
    end

    it 'With valid params, find question and answer in database' do
      @createService = FaqModule::CreateService.new({question: @question, answer: @answer, hashtag: @hashtags})

      response = @createService.call
      expect(Faq.last.question).to eq(@question)
      expect(Faq.last.answer).to eq(@answer)
    end

    

  end

end
