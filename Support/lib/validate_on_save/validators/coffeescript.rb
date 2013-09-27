class VOS
  class Validate
    def self.coffeescript
      binary = ENV['TM_COFFEELINT'] ||= "coffeelint"
      filepath = ENV['TM_FILEPATH']
      VOS.output({
        :info => "Running syntax check with CoffeeScript lint\n",
        :result => `"#{binary}" "#{filepath}" 2>&1`
          .sub(/^\s*/, '')
          .gsub(/\x1b\[\d{1,2}m(?:\x1b\[\d{1,2}m)?/, ''),
        :match_ok => /0 error\(s\)\, /i, # ignore warnings
        :match_line => /line (\d+)/i,
        :lang => "CoffeeScript"
      })
    end
  end
end
