class StaticPagesController < ApplicationController
	def home
    @asset = current_user.assets.build if signed_in?
	end

	def help
	end

	def about
	end
end