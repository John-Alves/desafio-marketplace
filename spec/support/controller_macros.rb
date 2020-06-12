module ControllerMacros
  def login_store
    before(:each) do
      @store = create(:store)
      sign_in @store
    end
  end
end