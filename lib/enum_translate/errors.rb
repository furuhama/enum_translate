# frozen_string_literal: true

module EnumTranslate
  # error base class
  class EnumTranslateError < StandardError; end

  class EnumTranslateArgumentError < EnumTranslateError; end
end
