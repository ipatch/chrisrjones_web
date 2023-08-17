# frozen_string_literal: true

# controller for serving up resume from tmp dir
class ResumeController < ApplicationController
  def index
    pdf_filename = Rails.root.join('tmp/chris-jones-resume.pdf').to_s
    send_file(pdf_filename, filename: 'chris-jones-resume.pdf', disposition: 'inline', type: 'application/pdf')
  end

  # def show
  #    pdf_filename = File.join(Rails.root, "tmp/chris-jones-resume.pdf")
  #    send_file(pdf_filename,
  #              :filename => "chris-jones-resume.pdf",
  #              :disposition => 'inline',
  #              :type => "application/pdf")
  # end
end
