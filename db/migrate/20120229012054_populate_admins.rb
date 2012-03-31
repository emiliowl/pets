class PopulateAdmins < ActiveRecord::Migration
  def up
    Admin.create!(:email => 'emilio.murta@msitbrasil.com',
                  :password => 'wl0912',
                  :password_confirmation => 'wl0912')
  end

  def down
    Admin.where(:email => 'emilio.murta@msitbrasil.com').destroy
  end
end
