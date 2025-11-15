require "json"
require "http/client"

class RestfulApi
  def initialize
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://api.restful-api.dev")
    @http_client = HTTP::Client.new(uri)
  end

  def get_objects() : JSON::Any
    JSON.parse(@http_client.get("/objects", headers: @headers).body)
  end

  def get_object(object_id : Int32) : JSON::Any
    JSON.parse(@http_client.get("/objects/#{object_id}", headers: @headers).body)
  end

  def add_object(name : String, data : JSON::Any) : JSON::Any
    body = {
      "name" => name,
      "data" => data
    }.to_json
    JSON.parse(
      @http_client.post("/objects", headers: @headers, body: body).body)
  end

  def update_object(object_id : Int32, data : JSON::Any) : JSON::Any
    body = {
      "name" => name,
      "data" => data
    }.to_json
    JSON.parse(
      @http_client.put("/objects/#{object_id}", headers: @headers, body: body).body)
  end

  def delete_object(object_id : Int32) : JSON::Any
    JSON.parse(@http_client.delete("/objects/#{object_id}", headers: @headers).body)
  end
end
