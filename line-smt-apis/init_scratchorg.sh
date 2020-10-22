alias=`date '+%Y%m%d%H%M%S'`
sfdx force:org:create -f config/project-scratch-def.json --setalias $alias --setdefaultusername
sfdx force:source:push