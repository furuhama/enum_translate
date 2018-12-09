# frozen_string_literal: true

require 'active_support/concern'

module EnumTranslate
  extend ActiveSupport::Concern

  def human_attribute_text(attribute_name)
    attribute_value = public_send(attribute_name)

    # enum の attribute を取得した場合、 String 型の値が返ってくるはず
    # そうでない場合には、引数の組み合わせはおかしいことが考えられるので例外を投げる
    raise EnumTranslateArgumentError, "#{self.class.name.underscore}.#{attribute_name} should be String value." unless attribute_value.is_a?(String)

    I18n.t "activerecord.attributes.#{self.class.name.underscore}/#{attribute_name}.#{attribute_value}", default: attribute_value
  end

  module ClassMethods
    def human_attribute_options(attribute_name)
      attribute_values = public_send(attribute_name.to_s.pluralize)

      # enum の attributes を取得した場合、 ActiveSupport::HashWithIndifferentAccess が返ってくるはず
      # そのため Hash 型の値が返ってきていない場合、引数の組み合わせがおかしいことが考えられるので例外を投げる
      raise EnumTranslateArgumentError, "#{name}.#{attribute_name} should be Hash-type value." unless attribute_values.is_a?(Hash)

      option_values_hash = I18n.t "activerecord.attributes.#{name.underscore}/#{attribute_name}", default: attribute_values

      attribute_values.keys.map { |attribute_value| [option_values_hash[attribute_value.intern], attribute_value] }
    end
  end
end
