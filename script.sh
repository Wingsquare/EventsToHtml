yrs=`ls`
content_file=content.html
echo "<html><body><table border='1'>" > $content_file


for yr in $yrs
do
	pwd=`pwd`
	yr_path=$pwd/$yr
	if [ -d $yr_path ];
	then
		months=`ls $yr_path`
		for month in $months
		do
			month_path=$yr_path/$month
			if [ -d $month_path ];
			then
				days=`ls $month_path`
				for day in $days
				do
					day_path=$month_path/$day
					if [ -d $day_path ];
					then
						dirs=`ls  $day_path`
						for dir in $dirs
						do
							dir_path=$day_path/$dir
							if [ -d $dir_path ];
							then
								if [ -f $dir_path/readme.gmk.txt ];
								then
									content=`cat $dir_path/readme.gmk.txt`
									echo "<tr>" >> $content_file
									echo "<td>$day.$month.$yr</td>" >> $content_file
									echo "<td><a href='file://$dir_path'>$dir</a></td>" >> $content_file
									echo "<td>$content</td>" >> $content_file
									echo "</tr>" >> $content_file
								fi
							fi
						done
					fi
				done
			fi
		done		
	fi
done

echo "</table></body></html>" >> $content_file


