source "$PR_SIZE_LABELER_HOME/src/github.sh"

main(){

export GITHUB_TOKEN="$1"
export DIR="$2"
export DAYS="$4"

git checkout -b delete_old_migrations;

# borrar los archivos con más de x dias de antiguedad
cd ${DIR};
for file in *.php ;
do
  dateFile=$(echo ${file} | tr -dc '0-9');
  dateCreated=$(date -d ${dateFile::-6} +%s)
  now=$(date -d 'now' +%s)
  days=$(( (now - dateCreated) / 86400 ))
  if [ $days -gt ${DAYS} ]
  then
    rm -v $file
  fi
done;

git add . ;
git -c user.name="GitHub Actions" -c user.email="actions@github.com" \
        commit -m "Delete old migrations" ;
git push --set-upstream origin "HEAD:delete_old_migrations";

github::create_pr $3 'delete_old_migrations'

}
