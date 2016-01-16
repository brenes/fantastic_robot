require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase

  def test_api_key_configuration
    api_key = Faker::Internet.password(20)
    TelegramBot.configure do |config|
      config.api_key = api_key
    end

    assert_equal(api_key, TelegramBot.configuration.api_key)
  end

  def test_delivery_method_configuration
    # Test default value
    assert_equal(:polling, TelegramBot.configuration.delivery_method)

    # Test option methods
    TelegramBot::Configuration::VALID_DELIVERY_METHODS.each do |d_method|
      TelegramBot.configure do |config|
        config.delivery_method = d_method
      end

      assert_equal(d_method, TelegramBot.configuration.delivery_method)
    end

    # Test a non-valid value
    assert_raises(ArgumentError) do
      TelegramBot.configure do |config|
        config.delivery_method = Faker::Lorem.word.to_sym
      end
    end
  end

  def test_callback_url_configuration
    # Test a valid URL
    valid_url = Faker::Internet.url
    TelegramBot.configure do |config|
      config.callback_url = valid_url
    end

    assert_equal(valid_url, TelegramBot.configuration.callback_url)

    # Test an invalid URL
    assert_raises(ArgumentError) do
      TelegramBot.configure do |config|
        config.callback_url = Faker::Lorem.word
      end
    end
  end
end
