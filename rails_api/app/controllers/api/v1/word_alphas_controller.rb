
# Ensure Versioning is done to support backward compatibility
# Too many versions can be handled through versionist gem

module Api
  module V1
    class WordAlphasController < ApplicationController
      def index
        @word_alpha = WordAlpha.fortunate
        render json:{ "results": [{"data":@word_alpha}]}, status: :ok
      end
    end
  end
end