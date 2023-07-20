class Program < ApplicationRecord

    enum :status, [:Error, :Activo, :Inactivo]

end
