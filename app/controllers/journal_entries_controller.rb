class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]
  def index
    @journal_entries = JournalEntry.all.order(created_at: :desc)
  end

  def show
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    respond_to do |format|
      if @journal_entry.save
        format.html { redirect_to @journal_entry, notice: 'Journal Entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @journal_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @journal_entry = JournalEntry.new
  end

  def destroy
    @journal_entry.destroy
    respond_to do |format|
      format.html { redirect_to journal_entries_url }
    end
  end

  def update
  respond_to do |format|
    if @journal_entry.update(journal_entry_params)
      format.html { redirect_to  @journal_entry, notice: 'Category was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json:  @journal_entry.errors, status: :unprocessable_entity }
    end
  end
 end

  private

  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end

  def journal_entry_params
    p = params.require(:journal_entry).permit(:title, :description)

    # populate categories
    if params['journal_entry']['pp_categories']
      categories = Category.create_and_find(params['journal_entry']['pp_categories'])
      p[:categories] = categories
    end

    return p
  end

end
