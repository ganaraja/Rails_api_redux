class WordAlpha < ApplicationRecord

  validates :word, presence: true

  def self.fortunate
    # Enable on the local system
    # word_count = WordAlpha.all.count
    # if word_count > 0
    #   word = WordAlpha.find(WordAlpha.first.id + rand(word_count)).word
    # else
    #   word = nil
    # end

    # Cache it on the production

    Rails.cache.fetch("all_records", expires_in: 12.hours) do
      WordAlpha.select("id, word").all
    end
    all_records = Rails.cache.fetch("all_records")
    word_count = Rails.cache.fetch("all_records").length
    offset = all_records.first.id
    retrieve_id = offset + rand(word_count)
    record = all_records.select  { |item|  item.id == retrieve_id}
    # record[0].word unless record.blank?
    unless record.blank?
      record[0].word
    else
      retrieve_id
    end
  end

  def self.add(word)
    self.create!(:word => word)
  end
end
