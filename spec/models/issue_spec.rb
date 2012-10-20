# == Schema Information
#
# Table name: issues
#
#  id                :integer          not null, primary key
#  volume            :integer
#  issue             :integer
#  printing_deadline :datetime
#  distribution      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  status            :string(255)
#

require 'spec_helper'

describe Issue do
  pending "add some examples to (or delete) #{__FILE__}"
end
