# Використовуємо базовий образ з Nginx
FROM nginx:latest

# Створюємо каталог для зберігання файлів конфігурації та сертифікатів
RUN mkdir -p /etc/nginx/ssl

# Додаємо файли конфігурації та сертифікати до образу
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY ssl/nginx.crt /etc/nginx/ssl/nginx.crt
COPY ssl/nginx.key /etc/nginx/ssl/nginx.key

# Відкриваємо потрібні порти
EXPOSE 80
EXPOSE 443

# Копіюємо файли вашого сайту
COPY src/index.html /usr/share/nginx/html/
COPY src/styles.css /usr/share/nginx/html/

# Команда для запуску Nginx
CMD ["nginx", "-g", "daemon off;"]
