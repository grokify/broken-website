#!ruby
require 'sinatra'

set :port, ENV['PORT']
set :public_folder, 'public'

newrelic_app_id = ENV['NEWRELIC_APP_ID']
newrelic_license_key = ENV['NEWRELIC_LICENSE_KEY']

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/newrelic.js' do
  content_type 'application/javascript'
  erb :newrelicjs, locals: {
    newrelic_license_key: newrelic_license_key,
    newrelic_app_id: newrelic_app_id}
end

get '/latency' do
  sleep_max = 20
  sleep_links = []
  0.upto(sleep_max) do |seconds|
    sleep_links << %Q{<a href="/latency?latency_time=#{seconds}">#{seconds}</a>}
  end
  sleep_links_html = sleep_links.join(' ')

  header_html = '<h1>Latency Generator</h1>'
  sleep_time = params[:latency_time].to_i
  if sleep_time >= 1 && sleep_time <= sleep_max
    sleep sleep_time
    header_html = %Q{
      <h1>Latency Generator: #{sleep_time} seconds</h1>
      <p>This is an example #{sleep_time} second latency response.</p>
    }
  end

  erb :latency, locals: {
    header_html: header_html,
    links_html: sleep_links_html}
end

get '/error' do
  error_status = params[:error_status].to_i
  error_codes = [400, 401, 402, 403, 404, 405, 406, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 421, 422, 423, 424,426, 428, 429, 431, 451, 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, 511]
  error_links = []
  error_codes.each do |code|
    error_links << %Q{<a href="/error?error_status=#{code}">#{code}</a>}
  end
  errors_links_html = error_links.join(' ')

  header_html = '<h1>Error Generator</h1>'
  if error_status >= 400 && error_status < 600
    status error_status
    header_html = %Q{
      <h1>Error Generator: #{error_status}</h1>
      <p>This is an example #{error_status} error.</p>
    }
  end

  erb :error, locals: {
    header_html: header_html,
    links_html: errors_links_html}
end
