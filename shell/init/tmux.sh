# Auto-attach tmux przy SSH with session picker
if [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]]; then
    sessions=$(tmux ls -F "#{session_name}" 2>/dev/null || true)

    if [[ -n "$sessions" ]]; then
        echo "Tmux sessions:"
        echo "$sessions" | nl
        echo "n) New session"
        read "choice?Select: "

        if [[ "$choice" == "n" ]]; then
            tmux new-session
        else
            session=$(echo "$sessions" | sed -n "${choice}p")
            tmux attach -t "$session"
        fi
    else
        tmux new-session
    fi
fi
