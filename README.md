# EnumTranslate

EnumTranslate is a gem to translate ActiveRecord::Enum defined attributes with i18n system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enum_translate'
```

## Usage

### Preparation

If you have an ActiveRecord model like this

```ruby
class Article < ActiveRecord::Base
  enum category: { finance: 0, lifehack: 1, technology: 2 }
end
```

include `EnumTranslate` module as a concern

```ruby
class Article < ActiveRecord::Base
  include EnumTranslate

  enum category: { finance: 0, lifehack: 1, technology: 2 }
end
```

And if you set `i18n` locale as `ja`

```ruby
I18n.locale = :ja
```

Please make a locale file like this

```yaml
ja:
  activerecord:
    attributes:
      article/category:
        finance: 経済
        lifehack: 生活豆知識
        technology: 技術
```

### APIs

#### Class Method

`.human_attribute_options(:attribute_name)`

```ruby
Article.human_attribute_options(:category)
# => [["経済", "finance"],
#     ["生活豆知識", "lifehack"],
#     ["技術", "technology"]]
```

#### Instance Method

`#human_attribute_text(:attribute_name)`

```ruby
article = Article.last
article.category
# => "technology"

article.human_attribute_text(:category)
# => "技術"
```

## Rubygems

https://rubygems.org/gems/enum_translate

## Contribute

PullRequests are welcome!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
