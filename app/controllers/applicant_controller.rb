class ApplicantController < ApplicationController
    before_action :authenticate_admin!
    def index
        @pagy, @applies = pagy(Apply.all)
    end
    
    def show
        @apply = Apply.all
        @colleges = College.all

        @has_questions = false
    end


    # PATCH/PUT /postulaciones/1
    def update
        respond_to do |format|
            if @apply.update(apply_params)
                format.html { redirect_to postulaciones_path(@apply), notice: "La pregunta ha sido actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_apply
            @apply = Apply.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def apply_params
            params.fetch(:test, {})
        end


end