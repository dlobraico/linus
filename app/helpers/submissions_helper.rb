module SubmissionsHelper
  def byline_or_writer_field(form, submission)
    unless @submission.writer.nil?
      form.text_field :byline, :value => @submission.writer.name
    else
      form.text_field :byline, :placeholder => "Byline"
    end
  end
end
