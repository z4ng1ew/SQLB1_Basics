SELECT
    (SELECT name
     FROM person p
     WHERE p.id = po.person_id) AS name,

    (SELECT name
     FROM person p
     WHERE p.id = po.person_id) = 'Denis' AS check_name

FROM person_order po
WHERE (menu_id = 13
       OR menu_id = 14
       OR menu_id = 18)
  AND order_date = '2022-01-07';




  (SELECT name FROM person p WHERE p.id = po.person_id) AS name
-- просто возвращает имя человека



(SELECT name FROM person p WHERE p.id = po.person_id) = 'Denis' AS check_name
-- берёт то же имя и сравнивает его со строкой 'Denis'
-- результат сравнения = true или false
```

---

**Итоговый результат выглядит примерно так:**
```
name   | check_name
-------+-----------
Denis  | true
Anna   | false
Denis  | true
```

---

**Простыми словами весь запрос говорит:**

> *"Для каждого заказа с menu_id 13, 14 или 18 от 7 января — покажи имя человека, и рядом напиши true если это Denis, false если нет"*

По сути `= 'Denis'` — это и есть та самая проверка из задания:
```
if (person_name == 'Denis') → true
else → false






`check_name` — это просто **псевдоним (alias)**, как и `name` через `AS name`.

```sql
(SELECT name FROM person p WHERE p.id = po.person_id) = 'Denis' AS check_name
--                                                                ^^^^^^^^^^
--                                             это просто название колонки в результате
```

Без него результат выглядел бы так:
```
name  | ?column?
------+---------
Denis | true
Anna  | false
```

С `AS check_name`:
```
name  | check_name
------+-----------
Denis | true
Anna  | false
```

То есть `AS check_name` просто **даёт красивое имя колонке** в выводе. Можешь назвать хоть `AS banana` — результат был бы тот же, просто колонка называлась бы иначе.