# frozen_string_literal: true

class ResumeController < ApplicationController
   def index
      pdf_filename = File.join(Rails.root, "tmp/chris-jones-resume.pdf")
      send_file(pdf_filename, :filename => "chris-jones-resume.pdf", :disposition => 'inline', :type => "application/pdf")
   end

   # def show
   #    pdf_filename = File.join(Rails.root, "tmp/chris-jones-resume.pdf")
   #    send_file(pdf_filename, :filename => "chris-jones-resume.pdf", :disposition => 'inline', :type => "application/pdf")
   # end
end
