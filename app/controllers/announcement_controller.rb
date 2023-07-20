class AnnouncementController < ApplicationController
    before_action :authenticate_admin!

    def index

        @pagy, @announcements = pagy(Announcement.all)
        @programs = Program.all

        @empty_announcements = false
        @action_alert = true
        @Announcement_has_ended = false

    end

    # POST /convocatorias
    def create

        # puts "Params received: #{params.inspect}"

        @announcement = Announcement.new(announcement_params)

        respond_to do |format|
            if @announcement.save
                format.html { redirect_to convocatorias_path(@announcement), notice: "La convocatoria ha sido creado exitosamente." }
            else
                format.html { render :index, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /convocatorias/1
    def update
        respond_to do |format|
            if @announcement.update(announcement_params)
                format.html { redirect_to convocatorias_path(@announcement), notice: "La convocatoria ha sido actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /convocatorias/1
    def destroy
        @announcement.destroy
        respond_to do |format|
            format.html { redirect_to convocatorias_path, notice: "La convocatoria ha sido eliminado exitosamente." }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_announcement
            @announcement = Announcement.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def announcement_params
            params.require(:announcement).permit(
                :name,
                :f_inicio,
                :f_fin,
                :min_creditos_sct,
                :max_creditos_sct,
                :ramos_reprobados,
                :program_id
            )
        end

end