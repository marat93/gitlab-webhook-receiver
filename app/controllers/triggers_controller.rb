class TriggersController < ApplicationController
  def create
    case params[:event_name]
    when "push"
      last_commit_id = params[:commits].last[:id]
      branch_name = params[:ref].match(/refs\/heads\/(.*)/)[1]

    when "merge_request"
      return
    else
      return
    end

    payload = {
      "commit": last_commit_id,
      "branch": branch_name,
      "author": {
        "name": params[:user_name],
        "email": params[:user_email]
      }
    }

    logger.info "Payload to Buildkite formed: #{payload}"

    buildkite_api_token = Rails.application.credentials[:buildkite_api_token]

    url = URI.parse("https://api.buildkite.com/v2/organizations/qanat/pipelines/rubie/builds")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    headers = { "Authorization": "Bearer #{buildkite_api_token}", "Content-Type": "application/json" }

    request = Net::HTTP::Post.new(url.path, headers)
    request.body = payload.to_json

    response = http.request(request)

    logger.info "Buildkite returned status #{response.code} following response: #{response.body}"
  end
end
