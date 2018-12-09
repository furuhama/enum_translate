# Set i18n configure for test
I18n.tap do |i18n|
  i18n.load_path = Dir["#{File.dirname(__FILE__)}/../fixtures/*.yml"]
  i18n.locale = :ja
end
