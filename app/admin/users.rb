ActiveAdmin.register User do
  menu false
    permit_params :email, :name, :descripcion, :telefono, :image, :empleado, :admin, :password, :password_confirmation
    config.sort_order = 'id_asc'
   
    index do
      selectable_column
        id_column
        column :name
        column :email
        
    end

    member_action :destroy, method: :delete do
      resource.destroy
        redirect_to users_sessions_path, notice: 'El usuario ha sido eliminado correctamente'
    end

    member_action :update, method: :patch do
      resource.update(user_params)
        redirect_to users_sessions_path, notice: 'El usuario ha sido editado correctamente'
    end

    member_action :cancel_edit, method: :get do
      redirect_to users_sessions_path, notice: 'La edición ha sido cancelada'
    end

    action_item :custom_action, only: [:index, :show] do
      link_to 'Volver', users_sessions_path
    end

    controller do
        private
  
        def user_params
          params.require(:user).permit(:email, :name, :descripcion, :telefono, :image, :empleado, :admin, :password, 
                                       :password_confirmation)
        end
    end
end
