require 'telegram_bot/model/message_attachment/base'
require 'telegram_bot/model/message_attachment/photo_size'
require 'telegram_bot/model/message_attachment/audio'
require 'telegram_bot/model/message_attachment/contact'
require 'telegram_bot/model/message_attachment/document'
require 'telegram_bot/model/message_attachment/location'
require 'telegram_bot/model/message_attachment/sticker'
require 'telegram_bot/model/message_attachment/video'
require 'telegram_bot/model/message_attachment/voice'

module TelegramBot
  class Model::Message < Model::Base

    attr_accessor :message_id, :from, :date, :chat, :forward_from, :fordward_date,
      :reply_to_message

    validates :message_id, :date, :chat, presence: true
    validates :message_id, :date, numericality: true

    attr_accessor :text, :audio, :document, :photo, :sticker, :video, :voice,
      :caption, :contact, :location

    attr_accessor :new_chat_participant, :left_chat_participant, :new_chat_photo,
      :delete_chat_photo, :group_chat_created, :supergroup_chat_created,
      :channel_chat_created, :migrate_to_chat_id, :migrate_from_chat_id

    validates :migrate_to_chat_id, numericality: true, unless: 'migrate_to_chat_id.blank?'
    validates :migrate_from_chat_id, numericality: true, unless: 'migrate_from_chat_id.blank?'

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      from: TelegramBot::Model::User,
      chat: TelegramBot::Model::Chat,
      fordward_from: TelegramBot::Model::User,
      reply_to_message: TelegramBot::Model::Message,
      audio: TelegramBot::Model::MessageAttachment::Audio,
      document: TelegramBot::Model::MessageAttachment::Document,
      photo: TelegramBot::Model::MessageAttachment::PhotoSize,
      sticker: TelegramBot::Model::MessageAttachment::Sticker,
      video: TelegramBot::Model::MessageAttachment::Video,
      voice: TelegramBot::Model::MessageAttachment::Voice,
      contact: TelegramBot::Model::MessageAttachment::Contact,
      location: TelegramBot::Model::MessageAttachment::Location,
      new_chat_participant: TelegramBot::Model::User,
      left_chat_participant: TelegramBot::Model::User,
      new_chat_photo: TelegramBot::Model::MessageAttachment::PhotoSize
    }

  end
end