module Site
  class Contact 
    include ActiveModel::Model 

    attr_accessor :email, :telephone, :property_id, :name, :message

    validates :email, email: true, presence: true
    validates :telephone, presence: true, numericality: true
    validates :property_id, presence: true 
    validates :name, :message, presence: true

    def send_message!
      if self.valid?
        true
      end
    end
  end
end