function fish_checkupdates
	set num (checkupdates | wc -l)
	if test $num = "0"
		echo No updates available!
	else if test $num = "1"
		echo There is $num update available!
	else
		echo There are $num updates available!
	end
end
