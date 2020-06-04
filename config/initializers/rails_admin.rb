RailsAdmin.config do |config|

  config.main_app_name = ['Gerenciamento da Loja', '']
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :store
  end
  config.current_user_method(&:current_store)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model Store do
    create do
      field :name
      field :site
      field :image
    end

    edit do
      field :name
      field :site
      field :image
      field :password do
        formatted_value do
          ''
        end
      end
      field :password_confirmation do
        formatted_value do
          ''
        end
      end
    end
  end

  config.model Product do
    create do
      field :name
      field :price
      field :installments
      field :image
      field :url

      field :store_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    edit do
      field :name
      field :price
      field :installments
      field :image
      field :url
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
