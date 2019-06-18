class ImagesController < ApplicationController

  def index
    o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
    @id = (0...11).map { o[rand(o.length)] }.join
  end

end
