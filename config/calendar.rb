require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'google/api_client/client_secrets'
require 'google/apis/calendar_v3'

class GCalAPI
  APPLICATION_NAME = 'demo'
  USER_ID = 'sskazuya1130@gmail.com' # 例). hoge@gmail.com
  TIME_ZONE = 'Japan'

  # CalendarID
  GCAL_ID = 'sskazuya1130@gmail.com'
  # callback URL
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'

  # 事前認証
  class << self
    def authorize
      dir_path = File.dirname(__FILE__)
      client_id = Google::Auth::ClientId.from_file("#{dir_path}/client_secrets.json")
      token_store = Google::Auth::Stores::FileTokenStore.new(
        file: "#{dir_path}/tokens.yaml")
      scope = 'https://www.googleapis.com/auth/calendar'
      authorizer = Google::Auth::UserAuthorizer.new(client_id, scope, token_store)
      credentials = authorizer.get_credentials(USER_ID)
      if credentials.nil?
        raise "credentials is none..."
      end
      credentials
    end

    # Google Calendar への登録
    def insert_gcal_event(gcal_type, evt_start, evt_end, summary, description, location)
        service = Google::Apis::CalendarV3::CalendarService.new
      service.client_options.application_name = APPLICATION_NAME
      service.authorization = self.authorize

      # 登録するイベント内容
      h_tmp = {
        summary: summary,
        description: description,
        location: location,
        start: {
          date_time: evt_start.iso8601,
          time_zone: TIME_ZONE
        },
        end: {
          date_time: evt_end.iso8601,
          time_zone: TIME_ZONE 
        }
      }

      event = Google::Apis::CalendarV3::Event.new(h_tmp)
      service.insert_event(GCAL_ID, event)
    end
  end
end

