module AuthenticationHelpers
  def sign_in(player)
    post login_path, params: { username: "testname", password: "testpass" }
  end
end
