class NotesController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_error
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    def index
        render json: Note.all
    end

    def show
        note = Note.find(params[:id])
        render json: note
    end

    def update
        note = Note.find(params[:id])
        note.update!(note_params)
        render json: note, status: :accepted
    end
    
    def create
        note = Note.create!(note_params)
        render json: note, status: :created 
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        head :no_content
    end
    
    private

    def note_params
        params.permit(:notes)
    end
    def render_error
        render json: {error: "Note not found"}, status: :not_found
    end
    def render_invalid(invalid)
        render json: {error: invalid.record.errors.full_message}, status: :unprocessable_entity
    end
end
