create_symlinks() {
  local src_dir="$1"
  local dest_dir="$2"
  local link_option="$3"

  cd "$src_dir" || exit 1

  local exclude_list=(".." ".git" ".gitmodules" ".gitignore" ".styluaignore" ".config")

  for e in .* *; do
    if [[ ! " ${exclude_list[@]} " =~ " ${e} " ]] && [ -e "$e" ]; then
      if [ -d "$dest_dir" ]; then
        ln -s"$link_option" "$PWD/$e" "$dest_dir"
      else
        mkdir -p "$dest_dir"
        ln -s"$link_option" "$PWD/$e" "$dest_dir"
      fi
      echo "Created symlink for $e in $dest_dir"
    fi
  done
}
