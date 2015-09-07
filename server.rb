require 'sinatra'
require 'sinatra/json'
require 'httparty'
require 'pry'

# get '/api/v1/tags' do
#   response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
#   tags = Hash.new 0
#   questions = response["items"]
#   questions.each do |question|
#     question["tags"].each do |tag|
#       tags[tag] += 1
#     end
#   end
#   json tags
# end
def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

client.get_all_tweets("sferik")
