class CollegeController < ApplicationController
    before_action :authenticate_admin!
    def index
        @pagy, @colleges = pagy(College.all)

        @programs = Program.all

        @countries = Country.all

        @empty_colleges = true
    end

    # POST /universidades
    def create
        @college = College.new(college_params)

        respond_to do |format|
            if @college.save
                format.html { redirect_to universidades_path(@college), notice: "La universidad ha sido creado exitosamente." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /universidades/1
    def update
        respond_to do |format|
            if @college.update(college_params)
                format.html { redirect_to universidades_path(@college), notice: "La universidad ha sido actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /universidades/1
    def destroy
        @college.destroy
        respond_to do |format|
            program.html { redirect_to universidades_path, notice: "La universidad ha sido eliminado exitosamente." }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_college
            @college = College.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def college_params
            params.fetch(:test, {})
        end

end


  