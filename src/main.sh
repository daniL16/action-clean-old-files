source "$PR_SIZE_LABELER_HOME/src/github.sh"

main(){

export GITHUB_TOKEN="$1"
export DIR="$3"
export DAYS="$5"

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

}
