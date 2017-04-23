require 'pry'
require 'yaml'

def load_library(file)
  myhash = {"get_meaning"=>{}, "get_emoticon" =>{}}
  library = YAML.load_file(file)
  library.each do |emotion, array|
      myhash["get_meaning"][array[1]] = emotion
      myhash["get_emoticon"][array[0]] = array[1]
  end
myhash
#binding.pry
end

#h = Hash.new { |h, k| h[k] = Hash.new { |hh, kk| hh[kk] = {} } }

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library.each do |method, hashs|
    if method == "get_emoticon"
      hashs.each do |eng, jap|
      #  binding.pry
        if emoticon == eng
          return jap
        elsif hashs.include?(emoticon) == false
          return "Sorry, that emoticon was not found"
        end
     end
    end
  end
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  library.each do |method, hashs|
    if method == "get_meaning"
      hashs.each do |jap, meaning|
      #  binding.pry
        if emoticon == jap
          return meaning
        elsif hashs.include?(emoticon) == false
          return "Sorry, that emoticon was not found"
        end
     end
    end
  end
end
