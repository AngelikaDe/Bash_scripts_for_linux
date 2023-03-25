source info.sh
start=`date +%s`

if [[ $# != 1 ]]; then
echo "To many arguments. Plese enter 1 argument and call the script again"
exit 0
fi
if [[ ${1: -1} != "/" ]]; then
echo "A path should end with '/'"
exit 0
fi

chmod +x ./info.sh
./info.sh $1

echo "Total number of folders (including all nested ones) = $num_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size)="
echo "$folders_max_size"
echo "Total number of files = $num_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $text_files"
echo "Executable files = $exec_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $arch_files"
echo "Symbolic links = $link_files"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for i in {1..10}
  do
    files_max_size=$(find $1 -type f -exec du -h {} + | sort -rh | head -n 10 | sed "${i}q;d" )
    if [ -z "$files_max_size" ]; then 
      echo "No such files"
      break
    fi
    end="${files_max_size##*.}"
    echo "$i - $(echo $files_max_size | awk '{print $2$3", "$1", "}')$end "
  done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
for i in {1..10}
  do
  exec_files_top=$(find $1 -type f -name -executable -exec du -h {} + | sort -rh | head -n 10 | sed "${i}q;d" )
      if [ -z "$exec_files_top" ]; then 
      echo "No such files"
      break
    fi
  end="${exec_files_top##*.}"
  echo "$i - $(echo $exec_files_top | awk '{print $2$3", "$1", "}')$end "
done
end=`date +%s`
runtime=$(echo "$end-$start" | bc -l)
echo "Script execution time (in seconds) = $runtime"