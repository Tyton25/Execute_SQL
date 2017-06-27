me: Execute_SQL.sh
# Description: Execute SQL script using arguments

usagetext=”usage: $0 <Database> <SQL script> <Argument File>”

if [ $# -lt 2 || $# -gt 3 ] ; then
	echo “Incorrect number of arguments. Script exiting without performing query.”
	echo $usagetext
	exit 1
fi

set dbn1=x
set dbn2=y
set dbn3=z
set DBN=$1

if [ $1 != dbn1 && $1 != dbn2 && $1 != dbn3 ] ; then
	echo “Database incorrect. Script exiting without performing query.”
	echo $usagetext
	exit 1
fi

echo “I-- Performing SQL query using $3 as input variable &1 in $2.“

if [ $# -eq 2 ] ; then
	sqlplus –s <database_name>/password@${DBN} @$2
elif [ $# –eq 3 ] ; then
	while read search_str ; do
		sqlplus –s <database_name>/password@${DBN} @$2 $search_str
	done < $3
fi

