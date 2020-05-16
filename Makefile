
all:
	docker build -t pankona/router           -f ./router/Dockerfile .
	docker build -t pankona/hashira-auth     -f ./config/hashira-auth/Dockerfile .
	docker build -t pankona/hashira-api      -f ./config/hashira-api/Dockerfile .
	docker build -t pankona/hashira-frontend -f ./config/hashira-frontend/Dockerfile .
