#!/bin/sh

git filter-branch --env-filter '
OLD_EMAIL="tzaiyang@126.com"
CORRECT_NAME="tzaiyang"
CORRECT_EMAIL="tzaiyang@stumail.neu.edu.cn"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
	    export GIT_COMMITTER_NAME="$CORRECT_NAME"
	        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
	fi
	if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
	then
		    export GIT_AUTHOR_NAME="$CORRECT_NAME"
		        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
		fi
		' --tag-name-filter cat -- --branches --tags
