# APIs: An Introduction

## What is an API?

  * API stands for Application Programming Interface.

  * It's a set of rules, code, specifications that software programs use to communicate with one another. 

APIs are all over the place--there is an API from your phone's GPS hardware to any software that accesses it, like an app. There's an API for your computer's operating system that lets you access various system functions, like the time or your printer settings, and on and on. 

You already use an API all the time, which is [the Ruby API](http://ruby-doc.org/stdlib-2.2.2). It determines the set of code and rules that let you interface with the interpreter.

At Launch when we talk about APIs, we're usually referring to web APIs. Tons of the sites you visit rely on APIs to function, or offer APIs so you can borrow their functionality.

## API Data in Action

- [Goodreads](http://www.goodreads.com)
  - Uses lots of APIs, most notably Amazon's API for actual [book information](https://www.goodreads.com/book/show/17351332-you-are-not-dead).
- [The Beat](http://sm.rutgers.edu/thebeat/?q=boston)
  - Uses the Instagram and Google Maps APIs to show what's near any given picture.
- Station is a digital communications agency in Zurich that uses the Twitter API to [display tweets](http://station.ch/about/live/) on the wall of their office lobby.
- [HexNa.me](http://hexna.me/) uses the Wordnik API to convert hex color codes into words in "English."

## Standardization! REST, JSON

REST stands for Representational State Transfer. It's a software architecture style that uses a stateless request protocol that usually is implemented with HTTP. 

REST also refers to some general standards for setting up external APIs for people to use. This is what people mean when they say the API for their site is RESTful. [This site](http://www.restapitutorial.com/lessons/whatisrest.html) is a great tutorial on RESTful principles and is a good idea to bookmark and return to later.

You'll also see JSON a lot again! As you know, JSON stands for JavaScript Object Notation, and it allows an API to return data in a standardized format. Well-designed, RESTful APIs will nearly always return JSON.
- Examples of what JSON from an api look like:
  - Recent pictures of kittens [on reddit](https://www.reddit.com/r/pics/search.json?q=kittens&sort=new)
  - Random list of words [from Wordnik](http://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=false&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5)
- While the content is different (in one case, the objects are more complex), the standardization of JSON means we have a basic idea of how to access what we get back from any given API endpoint.
- To make JSON look pretty in the browser, use [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en) with Chrome or Firefox.

## Navigating API Documentation

- Check to see if you need a key to use an API.
- Check to see what limits are in place and be sure to use the API within the terms of service to prevent your app from not working and being sad. Womp.
- Skimming is key! Learn to look for how to get the information you want, quickly.
- Some examples of API docs:
  - [Wordnik API](http://developer.wordnik.com/docs.html)
  - [Reddit API](https://www.reddit.com/dev/api)
  - [Github API](https://developer.github.com/v3/)
- Look for "developer-friendly" language--easy to navigate docs, no need to pay for a basic usage key, that kind of thing. 

## But How Do I Actually Make an API Call?
One nice and easy way to get started is using [HTTParty](https://github.com/jnunemaker/httparty), which is a library that lets us make HTTP requests with Ruby.

## Let's Make an API call *and* Make Our Own API!
- require 'sinatra/json'
- get '/api/v1/tags'

```ruby
require 'sinatra'
require 'sinatra/json'
require 'httparty'
require 'pry'

get '/api/v1/tags' do
  response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
  tags = Hash.new 0
  questions = response["items"]
  questions.each do |question|
    question["tags"].each do |tag|
      tags[tag] += 1
    end
  end
  json tags
end
```

## Can't Find the API You Want?
- Make it! Be the API you want to see in the world!





