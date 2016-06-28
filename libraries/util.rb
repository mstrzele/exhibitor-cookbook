# libraries/util.rb

module Exhibitor
  module Util
    def render_properties_file(config = {})
      config.sort_by { |k, _v| k }.collect do |k, v|
        "#{k.tr('_', '-')}=#{v}"
      end.join "\n"
    end

    def render_s3_credentials(config)
      config.sort_by { |k, _v| k }.collect do |name, val|
        "com.netflix.exhibitor.s3.#{name.tr('_', '-')}=#{val}"
      end.join "\n"
    end

    def format_cli_options(opts)
      opts.sort_by { |k, _v| k }.collect do |opt, val|
        "--#{opt} #{val}"
      end.join ' '
    end
  end
end
