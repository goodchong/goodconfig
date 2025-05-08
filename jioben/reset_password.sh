#!/bin/bash

for user in $(awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd); do
    NEW_PASSWORD=$(openssl rand -base64 8)
    echo "$user:$NEW_PASSWORD" | sudo chpasswd
    echo "用户 $user 的新密码是 $NEW_PASSWORD"
done

