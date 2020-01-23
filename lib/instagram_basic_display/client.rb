# frozen_string_literal: true

# Copyright 2020 ConvertKit, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'forwardable'
require 'instagram_basic_display/auth'

module InstagramBasicDisplay
  class Client
    extend Forwardable

    def_delegators :@auth, :short_lived_token, :long_lived_token, :refresh_long_lived_token

    def initialize
      @auth = Auth.new(configuration)
    end

    def configuration
      @configuration ||= InstagramBasicDisplay::Configuration.new
    end

    def configure
      yield(configuration) if block_given?
      nil
    end
  end
end