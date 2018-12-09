RSpec.describe EnumTranslate do
  class Article < ActiveRecord::Base
    include EnumTranslate

    enum category: { finance: 0, lifehack: 1, technology: 2 }
  end

  describe '.human_attribute_options' do
    subject { Article.human_attribute_options(:category) }

    let(:result) do
      [
        ["経済", "finance"],
        ["生活豆知識", "lifehack"],
        ["技術", "technology"]
      ]
    end

    it { is_expected.to eq result }
  end

  describe '#human_attribute_text' do
    subject { article.human_attribute_text(:category) }

    let(:article) { Article.new(category: :finance) }

    it { is_expected.to eq '経済' }
  end

  describe 'gemspec' do
    it 'has a version number' do
      expect(EnumTranslate::VERSION).not_to be nil
    end
  end
end
