class FormPanelController < ApplicationController
    before_action :authenticate_admin!
    def index
        @pagy, @applies = pagy(Apply.all)
    end

    # POST /formulario
    def create
        @question = Question.new(question_params)

        respond_to do |format|
            if @question.save
                format.html { redirect_to formulario_path(@question), notice: "La pregunta ha sido creado exitosamente." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /formulario/1
    def update
        respond_to do |format|
            if @question.update(question_params)
                format.html { redirect_to formulario_path(@question), notice: "La pregunta ha sido actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /formulario/1
    def destroy
        @question.destroy
        respond_to do |format|
            format.html { redirect_to formulario_path, notice: "La pregunta ha sido eliminado exitosamente." }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_question
            @question = Question.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def question_params
            params.fetch(:test, {})
        end

end