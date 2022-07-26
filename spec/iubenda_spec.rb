# spec/iubenda_spec.rb
require_relative '../iubenda'
require 'pry'
RSpec.describe "Iubenda" do
  describe "#execute" do
    let!(:template) {
      "A T&C Document
      This document is made of plaintext.
      Is made of [CLAUSE-3].
      Is made of [CLAUSE-4].
      Is made of [SECTION-1].
      Your legals."
    }
    let(:clauses){
      [
        { "id": 1, "text": "The quick brown fox" },
        { "id": 2, "text": "jumps over the lazy dog" },
        { "id": 3, "text": "And dies" },
        { "id": 4, "text": "The white horse is white" }
      ]
    }
    let(:sections) {
      [
        { "id": 1, "clauses_ids": [1, 2] }
      ]
    }

    it "transforms template" do
      text = 
      "A T&C Document
      This document is made of plaintext.
      Is made of And dies.
      Is made of The white horse is white.
      Is made of The quick brown fox;jumps over the lazy dog.
      Your legals."
      expect(Iubenda.new(template, clauses, sections).execute).to eq(text)
    end
  end
end
