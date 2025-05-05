# Etapa de build
FROM node:18-alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Etapa de producción
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 7000
CMD ["nginx", "-g", "daemon off;"]
