# frozen_string_literal: true

require 'active_support/concern'

module EnumTranslate
  extend ActiveSupport::Concern

  def human_attribute_text(attribute_name)
    attribute_value = public_send(attribute_name)

    # `attribute_value` is a return value of calling ActiveRecord::Enum attribute instance API.
    #  It should be a String value, and raise an error if not.
    raise EnumTranslateArgumentError, "#{self.class.name.underscore}.#{attribute_name} should be String value." unless attribute_value.is_a?(String)

    I18n.t "activerecord.attributes.#{self.class.name.underscore}/#{attribute_name}.#{attribute_value}", default: attribute_value
  end

  module ClassMethods
    def human_attribute_options(attribute_name)
      attribute_values = public_send(attribute_name.to_s.pluralize)

      # `attribute_values` is a return value of calling ActiveRecord::Enum attribute class API.
      #  It should be a ActiveSupport::HashWithIndifferentAccess value, and raise an error if it is not inherited a Hash class.
      raise EnumTranslateArgumentError, "#{name}.#{attribute_name} should be Hash-type value." unless attribute_values.is_a?(Hash)

      option_values_hash = I18n.t "activerecord.attributes.#{name.underscore}/#{attribute_name}", default: attribute_values

      attribute_values.keys.map { |attribute_value| [option_values_hash[attribute_value.intern], attribute_value] }
    end
  end
end
