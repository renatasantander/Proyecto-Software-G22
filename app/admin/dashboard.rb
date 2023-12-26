ActiveAdmin.register_page "Dashboard" do
  menu false
    action_item :custom_action do
      link_to 'Volver', users_sessions_path
    end
    action_item :custom_action do
      link_to 'Usuarios', admin_users_path
    end
end