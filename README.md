# iubenda

  The T&C generator is a software which given:
  A template
  A dataset
  transforms the template into a Document expanding the template tags into their representation using
  the dataset. Below you can find more details.

## system requirements

  ruby 3.0.0

## Initial Setup

  gem install rspec

## how it works

  Given the following template:
    A T&C Document
    This document is made of plaintext.
    Is made of [CLAUSE-3].
    Is made of [CLAUSE-4].
    Is made of [SECTION-1].
    Your legals.

  And the following dataset:

  clauses:
    [
      { "id": 1, "text": "The quick brown fox" },
      { "id": 2, "text": "jumps over the lazy dog" },
      { "id": 3, "text": "And dies" },
      { "id": 4, "text": "The white horse is white" }
    ]

  sections:
    [
      { "id": 1, "clauses_ids": [1, 2] }
    ]

    running Iubenda.new(template, clauses, sections).execute 

  Creates the following T&C document:
    A T&C Document
    This document is made of plaintext.
    Is made of And dies.
    Is made of The white horse is white.
    Is made of The quick brown fox;jumps over the lazy dog.
    Your legals.
