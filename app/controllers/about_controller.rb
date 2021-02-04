class AboutController < ApplicationController
  def index
    @about_us = Faker::Hipster.paragraph(1000)
  end
end
