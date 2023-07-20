class ProgramController < ApplicationController
    before_action :authenticate_admin!

    def index
        @pagy, @programs = pagy(Program.all)
        @has_data = true
    end

    # POST /programas
    def create
        @program = Program.new(program_params)

        respond_to do |format|
            if @program.save
                format.html { redirect_to programas_path(@program), notice: "El programa ha sido creado exitosamente." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /programas/1
    def update
        respond_to do |format|
            if @program.update(program_params)
                format.html { redirect_to programas_path(@program), notice: "El programa ha sido actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /programas/1
    def destroy
        @program.destroy

        respond_to do |format|
            format.html { redirect_to programas_path, notice: "El programa ha sido eliminado exitosamente." }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_program
            @program = Program.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def program_params
            params.fetch(:test, {})
        end
end