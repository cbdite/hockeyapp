module HockeyApp
  class Statistic
    extend  ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include ActiveModelCompliance

    ATTRIBUTES = [:id, :version, :short_version, :created_at, :crashes, :devices, :downloads,
        :installs, :last_request_at, :usage_time]

    attr_accessor *ATTRIBUTES
    attr_reader :app


    def self.from_hash(h, app, client)
      res = self.new app, client
      ATTRIBUTES.each do |attribute|
        attribute_str = attribute.to_s

        if attribute_str == 'id' || attribute_str == 'version' || attribute_str == 'short_version' || attribute_str == 'created_at'
          res.send("#{attribute_str}=", h[attribute_str]) unless (h[attribute_str].nil?)
        else
          statistics = h['statistics']

          res.send("#{attribute_str}=", statistics[attribute_str]) unless (statistics[attribute_str].nil?)
        end
      end
      res
    end

    def initialize app, client
      @app = app
      @client = client
    end


    def log

    end

    def description

    end


    private

    attr_accessor :client


  end
end