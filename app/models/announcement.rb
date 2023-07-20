class Announcement < ApplicationRecord

    enum :status, [:Error, :Activo, :En_revisión, :Concluido]

    belongs_to :program 

end
