
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


# --- Function: Fuzzy find directory and cd ---
fd() {
  local dir
  dir=$(find "${1:-.}" -maxdepth 3 -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m)
  [[ -n "$dir" ]] && cd "$dir"
}

    # --- Function: Fuzzy find directory, open tmux session there ---
    fdx() {
      local dir session_name
      dir=$(find "${1:-.}" -maxdepth 3 -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m) || return
      session_name=$(basename "$dir")

      if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -d -s "$session_name" -c "$dir"
      fi

      tmux attach -t "$session_name"
    }

    # --- Function: Open tmux session based on current directory name ---
    tmux-sessionizer() {
      local dir session_name
      dir="$PWD"
      session_name=$(basename "$dir")

      if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -d -s "$session_name" -c "$dir"
      fi

      tmux attach -t "$session_name"
    }
  # --- anyconnect ---
  anyconnect() {
    sudo openconnect --protocol=anyconnect --server=webvpn.dha.gov.ae --servercert pin-sha256:aAHaL/o3+w8U5a+ltFuCJaL7TNRjJRac21comZQpNrc=
  }
# --- Optional: Add quick aliases ---
alias f='fd'
alias fx='fdx'
alias ts='tmux-sessionizer'
alias vi='nvim'

    # --- Node and Postgres environment setup ---
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


    plugins=(git)

    source $ZSH/oh-my-zsh.sh
