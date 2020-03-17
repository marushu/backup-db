cat <<EOM

Default value:
 - change direcroty : wordpress
 - want to put db directory : ../
rename(bool) default → false
 - rename === fale : file name → backup.sql
 - rename === true : file name → backup_Y-m-d-H-M-S.sql

EOM

read -p "change direcroty / want to put db directory / rename > " d1 d2 d3 d4;

printf '%1s\033[31m%2s\033[m\n' "your change directory → " ${d1:='wordpress'};
printf '%1s\033[31m%2s\033[m\n' "your backup directory → " ${d2:='../'};

cd $d1;

if [ ${d3:='false'} ]; then
  file_name="backup.sql";
else
  file_name="backup_`date +%Y-%m-%d-%H-%M-%S`.sql"
fi

echo 'Now backup file → '$file_name' per hour. :)';

while true;
 do wp db export "$d2""$file_name";
 sleep 3600;
done
