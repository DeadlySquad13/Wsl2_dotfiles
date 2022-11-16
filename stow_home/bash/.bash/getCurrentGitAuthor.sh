getCurrentGitAuthor() {
  local name=$(git config --get user.name)
  local email=$(git config --get user.email)

  echo "$name <$email>"
}

getCurrentGitAuthor
