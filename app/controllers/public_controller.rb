# frozen_string_literal: true

class PublicController < ApplicationController # :nodoc:
  layout 'public'

  before_action :setup_navigation

  def index
    # intro text
    @subjects = Subject.visible.sorted
  end

  def show
    @page = Page.where(permalink: params[:permalink], visible: true).first
    redirect_to(action: 'index') if @page.nil?
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end
end
