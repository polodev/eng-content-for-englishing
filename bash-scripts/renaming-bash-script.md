```php
count=1
for f in *; do
  if [ -f "$f" ]; then
    printf -v num "%02d" "$count"
    mv "$f" "${num}-learn-vocabulary-through-stories-${f}"
    count=$((count+1))
  fi
done
```
