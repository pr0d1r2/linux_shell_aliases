# Useful for MacVim users on remote terminals
function mvim() {
  vim $@ || return $?
}
