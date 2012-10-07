# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  headline   :string(255)
#  byline     :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  issue_id   :integer
#  writer_id  :string(255)
#

require 'spec_helper'

describe Submission do
  pending "add some examples to (or delete) #{__FILE__}"
end
