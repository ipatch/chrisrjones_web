# frozen_string_literal: true

class ArticleSerializer # :nodoc:
  include FastJsonapi::ObjectSerializer
  attributes :title, :text, :slug
end
