# Базовый образ Node.js (маленький, быстрый)
FROM node:20-alpine

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем весь код проекта
COPY . .

# Собираем проект (Nest CLI компилирует TypeScript → JS)
RUN npm run build

# Открываем порт 3000
EXPOSE 3000

# Запуск приложения в проде
CMD ["npm", "run", "start:prod"]