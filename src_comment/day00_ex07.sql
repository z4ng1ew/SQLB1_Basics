SELECT id,
       name,
       CASE
           WHEN age BETWEEN 10 AND 20 THEN 'interval #1'
           WHEN age > 20
                AND age < 24 THEN 'interval #2'
           ELSE 'interval #3'
       END AS interval_info
FROM person
ORDER BY 3;






**`CASE WHEN`** — это просто **if/else** из программирования, только на SQL:

```sql
CASE
    WHEN age BETWEEN 10 AND 20 THEN 'interval #1'  -- если возраст 10-20 → пиши это
    WHEN age > 20 AND age < 24 THEN 'interval #2'  -- если возраст 21-23 → пиши это
    ELSE 'interval #3'                              -- во всех остальных случаях → пиши это
END AS interval_info                                -- назови эту колонку interval_info
```

---

**Итоговый результат выглядит так:**

```
id | name  | interval_info
---+-------+--------------
1  | Anna  | interval #1     -- ей 16 лет
2  | Denis | interval #3     -- ему 25 лет
3  | Kate  | interval #2     -- ей 22 года
```

---

**`ORDER BY 3`** — сортировка по **третьей колонке**, то есть по `interval_info`. Можно было написать и так:

```sql
ORDER BY interval_info  -- то же самое
```

Просто `3` это сокращение — "сортируй по третьей колонке в SELECT".

---

**Весь запрос простыми словами:**

> *"Выведи id, имя и возрастной интервал каждого человека, отсортировав по интервалу"*