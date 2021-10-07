function fish_greeting
  set -l FILE "$HOME/docs/todo.txt"

  if [ ! -e $FILE ]
    return
  end

  if type -q bat
    bat --paging=never -pl javascript $FILE
  else
    cat $FILE
  end
end
