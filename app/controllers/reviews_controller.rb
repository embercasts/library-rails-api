class ReviewsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
end
