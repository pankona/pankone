FROM node:12.13.0-alpine as builder

RUN apk --update add curl bash git python make g++ && curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.10.1

ENV PATH="/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH"

WORKDIR /app

COPY ./hashira .

WORKDIR /app/cmd/hashira-frontend

RUN yarn install
RUN yarn build

FROM nginx:1.14

WORKDIR /app

COPY --from=builder /app/cmd/hashira-frontend/build .

ADD config/hashira-frontend/nginx/nginx.conf /etc/nginx/conf.d/default.conf
