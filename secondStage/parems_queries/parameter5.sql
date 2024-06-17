select
c.category_name,
c.category_id,
pr.product_id,
pr.product_name
from
categorys c
join 
products pr on pr.category_id = c.category_id
where 
c.category_id=&<name="category_name"
list="select category_id,category_name from categorys order by category_name" 
description="yes" restricted="yes" >


