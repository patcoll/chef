#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2009 Opscode, Inc.
# License:: Apache License, Version 2.0
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
#

require 'chef/knife'

class Chef
  class Knife
    class NodeBulkDelete < Knife

      deps do
        require 'chef/node'
        require 'chef/json_compat'
      end

      banner "knife node bulk delete REGEX (options)"

      def run
        if name_args.length < 1
          ui.fatal("You must supply a regular expression to match the results against")
          exit 42
        end

        bulk_delete(Chef::Node, "node", nil, nil, name_args[0])
      end
    end
  end
end

