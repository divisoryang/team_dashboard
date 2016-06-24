# Docker Deploy procedure

1. modify Dockerfile (it's now use UTC+8 timezone) and database config file

2. docker build -t team_dashboard .

3. create db:

		docker run -i -t -v /workspace/team_dashboard/config/database.yml:/team_dashboard/config/database.yml -v /workspace/team_dashboard/config/plugins.yml:/team_dashboard/config/plugins.yml -p 3000:3000 --entrypoint /bin/bash team_dashboard
		$ RAILS_ENV=production rake db:create
		$ RAILS_ENV=production rake db:migrate

4. modify paths, ports in docker-compose.yml if needed.

5. docker-compose up d

