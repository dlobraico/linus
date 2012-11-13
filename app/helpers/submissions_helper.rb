module SubmissionsHelper
  def byline_or_writer_field(form, submission)
    if (not @submission.byline.nil?)
      form.text_field :byline, :placeholder => "Byline"
    elsif (not @submission.writer.nil?)
      form.text_field :byline, :value => @submission.writer.name
    else
      form.text_field :byline
    end
  end

  def boolean_to_unicode(bool)
    if bool
      "<span class='true'>&#10003;</span>"
    else
      "<span class='false'>&#10008;</span>"
    end
  end
end
