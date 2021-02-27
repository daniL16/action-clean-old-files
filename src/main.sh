source "$PR_SIZE_LABELER_HOME/src/github.sh"

main(){

export GITHUB_TOKEN="$1"
export DIR="$3"
export DAYS="$5"

# borrar los archivos con más de x dias de antiguedad
ls -la;
find "${DIR}" -type f -mtime +"${DAYS}" -exec rm -vf {} \;

}
