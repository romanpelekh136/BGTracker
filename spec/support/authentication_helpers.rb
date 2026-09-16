module AuthenticationHelpers
  def sign_in(player)
    post login_path, params: { username: player.username, password: player.password }
  end
end
