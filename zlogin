echo "\e[95mWelcome cx $(echo ~)\e[0m"
echo "\e[32m"
fortune
echo "\e[0m"

WEEK_DAY=$(date "+%w")
if [[ $WEEK_DAY -eq 5 ]];then
      echo "\e[31mToday is Friday,ruanyf/weekly update!\e[0m"
      echo "\e[31m\e[4mgithub.com/ruanyf/weekly\e[0m"
fi

echo "\e[33m"
leave +1200
echo "\e[0m"

