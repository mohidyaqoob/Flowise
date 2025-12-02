FROM node:18

WORKDIR /app

RUN npm install -g pnpm

COPY . .

RUN pnpm install
RUN pnpm build

EXPOSE 3000

CMD ["pnpm", "start"]
