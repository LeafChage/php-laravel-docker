# !/bin/sh
echo "Local"
echo "Waiting for mysql"

until mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD; do
    echo "mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD"
    echo -n "."
    sleep 1
done

echo "MySQL is up - executing command"

php-fpm