# frozen_string_literal: true

require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

playable_letters = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'ij',
  'z'
]

before do
  headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  content_type :json
end

options '*' do
  response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
  response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
end

get '/word/:letter_count' do
  letter_count = params['letter_count']
  letter_count
  letter = playable_letters.sample
  path = "words/#{letter_count}/#{letter}.txt"
  word = File.readlines(path).sample.chomp
  
  { word:  word }.to_json
end
