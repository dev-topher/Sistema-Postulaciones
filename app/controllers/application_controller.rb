class ApplicationController < ActionController::Base
    include Pagy::Backend
    def after_sign_in_path_for(resource)
        if resource.is_a?(User)
            formulario_path
        elsif resource.is_a?(Admin)
            dashboard_path
        else
            root_path
        end
    end

end
