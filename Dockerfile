# Використовуємо базовий образ з Nginx
FROM nginx:latest

# Створюємо каталог для зберігання файлів конфігурації та сертифікатів
RUN mkdir -p /etc/nginx/ssl

# Додаємо файли конфігурації та сертифікати до образу
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.crt /etc/nginx/ssl/nginx.crt
COPY nginx.key /etc/nginx/ssl/nginx.key

# Відкриваємо потрібні порти
EXPOSE 80
EXPOSE 443

# Копіюємо файли вашого сайту
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Команда для запуску Nginx
CMD ["nginx", "-g", "daemon off;"]
