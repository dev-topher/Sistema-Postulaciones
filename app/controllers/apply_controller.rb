class ApplyController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = User.find(current_user.id)
        @is_able_to_apply = false
    end

    def application_history

        @has_applies = true

        if @has_applies == true 
            @has_modifiable_applications = true
        end
        
    end

    def show
        #@apply = Apply.find(params[:id])
        @is_able_to_modify = true
        @has_additional_questions = true
    end

    def form
        
    end

    def create
        @apply = Apply.new(announcement_params)

        respond_to do |format|
            if @apply.save
                format.html { redirect_to convocatorias_path(@apply), notice: "La postulación ha sido creado exitosamente." }
            else
                format.html { render :new, status: :unprocessable_entity }
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