require_relative './../../spec_helper.rb'

describe FaqModule::ListService do

  before do
    @company = create(:company)
  end

  describe "#call" do

    it 'return not found if there are no faqs' do
      @ListService = FaqModule::ListService.new({}, 'list')

      response = @ListService.call
      expect(response).to match("Nothing found")
    end

    it 'has two faqs, question and answer in response' do
      @ListService = FaqModule::ListService.new({}, 'list')

      faq1 = create(:faq, company: @company)
      faq2 = create(:faq, company: @company)

      response = @ListService.call

      expect(response).to eq faq1.question
      expect(response).to eq faq1.answer

      expect(response).to eq faq2.question
      expect(response).to eq faq2.answer
    end

    it 'with search command: With empty query, return message nothing found' do
      @ListService = FaqModule::ListService.new({'query' => ''}, 'search')

      response = @listService.call
      expect(response).to match("Nothing found")
    end

    it 'with search command: With valid query, find question and answer in response' do
      @listService = FaqModule::ListService.new({'query' => faq.question.split(" ").sample}, 'search')

      response = @listService.call

      expect(response).to match(faq.question)
      expect(response).to match(faq.answer)
    end
  end
end
