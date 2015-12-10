class ApiController < ApplicationController
	before_filter :set_headers
	skip_before_action :verify_authenticity_token
	respond_to :html, :json, :xml
	require 'openssl'
	
	def google
		response = HTTParty.get(params[:url])
		render :json => response
	end
	
	def set_headers
	  headers['Access-Control-Allow-Origin'] = '*'
	  headers['Access-Control-Expose-Headers'] = 'Etag'
	  headers['Access-Control-Allow-Methods'] = 'POST'
	  headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-   Modified-Since, If-None-Match'
	  headers['Access-Control-Max-Age'] = '86400'
	end
end
