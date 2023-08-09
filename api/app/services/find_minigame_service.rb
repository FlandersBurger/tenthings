# SELECT list_id, value, name
# FROM list_values lv
# INNER JOIN lists l
# ON lv.list_id = l.id
# WHERE value IN
# (
# 	SELECT value
# 	FROM list_values
# 	GROUP BY value
# 	HAVING count(*) >= 3
# 	ORDER BY random()
# 	LIMIT 1
# )