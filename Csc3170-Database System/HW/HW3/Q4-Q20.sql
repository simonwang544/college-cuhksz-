Q4:
根据您的要求，您需要从 worker 表中选择 LAST_NAME 列，并为这个列使用别名 WORKER_NAME。以下是相应的SQL查询:
SELECT LAST_NAME AS WORKER_NAME FROM worker;
执行这条查询后，您将得到每个员工的姓氏，并且这一列在结果中将被标记为 WORKER_NAME。这符合您提供的输出格式。

Q5:
为了获取 worker 表中的 FIRST_NAME 并转换为小写，同时保持列名 FIRST_NAME 不变,您可以使用以下 SQL 查询：
SELECT LOWER(FIRST_NAME) AS FIRST_NAME FROM worker;
执行这个查询后，结果将是所有 FIRST_NAME 数据以小写形式显示，且结果集的列标题将是 FIRST_NAME。
The output of your code should be:
FIRST_NAME //这是新的列表的列名
monika
niharika
vishal
amitabh
vivek
vipul
satish
geetika


Q6:
要从 worker 表中获取 DEPARTMENT 列的唯一值，您可以使用 DISTINCT 关键字。这里是相应的 SQL 查询：
SELECT DISTINCT DEPARTMENT FROM worker;
执行这个查询将返回 worker 表中所有独特的 DEPARTMENT 值，没有重复。

Q7:
为了获取 worker 表中每个独特的 DEPARTMENT 名称的长度，且确保每个 DEPARTMENT 名称只被计算一次，
正确的查询应该使用 DISTINCT 关键字来选择独特的 DEPARTMENT 名称，并用 LENGTH 函数来获取每个名称的长度。这里是更正后的SQL查询:
SELECT LENGTH(DISTINCT DEPARTMENT) AS LENGTH FROM worker;
不过,上面的查询在某些SQL版本中可能不工作,因为 DISTINCT 关键字通常不与 LENGTH 函数直接结合使用。
(oj-sqllite版本)如果遇到错误，可以通过子查询来获取独特的 DEPARTMENT 名称，然后计算这些名称的长度，如下所示：
SELECT LENGTH(DEPARTMENT) AS LENGTH FROM (SELECT DISTINCT DEPARTMENT FROM worker);
这个查询首先通过子查询选择 worker 表中所有独特的 DEPARTMENT,然后外层查询计算这些独特名称的长度。这样就能得到您需要的输出：每个独特的 DEPARTMENT 名称的长度。


Q8:
要按 `FIRST_NAME` 降序打印 `worker` 表中所有工作人员的详细信息，您可以使用以下 SQL 查询：
SELECT WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT FROM worker
ORDER BY FIRST_NAME DESC;
//可以分成三行名也可以只在一行
这个查询将返回 `worker` 表中的所有记录，按 `FIRST_NAME` 列的降序排序。这意味着从字母顺序上来看，最后一个名字（在英文字母排序中）的记录会首先显示，以此类推，直到第一个名字的记录。

Q9:
要打印部门名称为 “Account” 的工作人员的详细信息，您可以使用以下 SQL 查询：

SELECT WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT FROM worker
WHERE DEPARTMENT = 'Account';
这个查询会选取 `worker` 表中 `DEPARTMENT` 字段为 "Account" 的所有记录，并按照您提供的列顺序返回它们的详细信息。
output:
WORKER_ID|FIRST_NAME|LAST_NAME|SALARY|JOINING_DATE|DEPARTMENT
6|Vipul|Diwan|200000|21-06-11 09.00.00|Account
7|Satish|Kumar|75000|21-01-20 09.00.00|Account

Q10:
为了打印 `LAST_NAME` 包含字母 'n' 的工作人员的详细信息，您可以使用 `LIKE` 运算符与通配符 `%` 来进行字符串匹配。以下是相应的 SQL 查询：

SELECT WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT
FROM worker
WHERE LAST_NAME LIKE '%n%';
这个查询会从 `worker` 表中选取那些 `LAST_NAME` 包含至少一个 'n' 字符的所有记录。`%` 通配符代表任意数量的任意字符，因此 `%n%` 匹配任何包含 'n' 的字符串。

Q11:
为了打印薪水在 200,000 到 500,000 之间的工作人员的详细信息，您可以使用 `BETWEEN` 运算符。以下是相应的 SQL 查询：

SELECT WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT
FROM worker
WHERE SALARY BETWEEN 200000 AND 500000;
这个查询将选取 `SALARY` 字段值在 200,000(包含)到 500,000(包含)之间的所有记录。

Q12:
要获取每个部门的工作人员数量，并按升序排列，同时打印部门名称，你可以使用 `COUNT` 函数来计算每个部门的工作人员数量，`GROUP BY` 来按部门分组，以及 `ORDER BY` 来按工作人员数量升序排列。
以下是相应的SQL查询:

SELECT DEPARTMENT, COUNT(*) AS No_Of_Workers
FROM worker
GROUP BY DEPARTMENT
ORDER BY No_Of_Workers ASC;
这个查询首先按 `DEPARTMENT` 分组，然后使用 `COUNT(*)` 计算每个组中的记录数（即每个部门的工作人员数量）。最后，查询结果按 `No_Of_Workers` 升序排列，确保输出与您提供的格式一致。

Q13:
为了打印同时是经理(Managers)的工作人员的 `FIRST_NAME`、`LAST_NAME` 和职位标题，您需要从 `worker` 表和 `title` 表中进行联合查询。
假设职位标题被存储在 `title` 表中，并且每个工作人员的 `WORKER_REF_ID` 在 `title` 表中与 `worker` 表的 `WORKER_ID` 相对应。以下是完成此任务的 SQL 查询：

SELECT w.FIRST_NAME, w.LAST_NAME, t.WORKER_TITLE
FROM worker w
JOIN title t ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';


这个查询通过在 `worker` 表（别名为 `w`）和 `title` 表（别名为 `t`）之间使用内部连接（`JOIN`）来工作，条件是 `worker` 表的 `WORKER_ID` 必须等于 `title` 表的 `WORKER_REF_ID`。
然后，它过滤出那些其 `WORKER_TITLE` 等于 "Manager" 的记录，最后选择这些工作人员的 `FIRST_NAME`、`LAST_NAME` 和他们的 `WORKER_TITLE`。这将产生您所需的输出格式。

Q14:






Q15:
为了获取薪水相同的工作人员列表，您可以使用分组（`GROUP BY`）和过滤(使用`HAVING`子句)来实现。下面的SQL查询首先按照薪水分组,
然后选出那些在同一薪水等级有多于一个工作人员的组。最后，根据这些薪水等级，再次从原始工作人员表中选取相关工作人员的信息。

SELECT w.WORKER_ID, w.FIRST_NAME, w.SALARY
FROM worker w
INNER JOIN (
    SELECT SALARY
    FROM worker
    GROUP BY SALARY
    HAVING COUNT(WORKER_ID) > 1
) AS same_salary ON w.SALARY = same_salary.SALARY
ORDER BY w.SALARY DESC, w.WORKER_ID;


这个查询的逻辑分为两步：

1. 子查询（`same_salary`）：这个子查询选出了薪水相同的那些薪水等级，即通过`GROUP BY SALARY`分组后，组内成员数（`COUNT(WORKER_ID)`）多于一个的薪水等级。
   
2. 主查询：然后，主查询通过内联`same_salary`子查询结果，选出那些薪水等级在子查询结果中的工作人员的`WORKER_ID`、`FIRST_NAME`和`SALARY`。

按照您的要求,这个查询将只返回薪水相同的工作人员列表,如果按照提供的数据,应该只会返回薪水为500000的Amitabh和Vivek。
`ORDER BY w.SALARY DESC, w.WORKER_ID` 这部分SQL语句指定了查询结果的排序规则。具体来说:

- `ORDER BY` 告诉数据库根据后面指定的列或条件来排序查询结果。

- `w.SALARY DESC` 表示首先按照 `SALARY` 列的值进行降序排序（`DESC` 是降序的缩写，代表从高到低）。`w` 是 `worker` 表的别名，所以 `w.SALARY` 指的是 `worker` 表中的 `SALARY` 列。

- `w.WORKER_ID` 在上一个排序条件（薪水降序）的基础上，如果存在薪水相同的情况，那么会按照 `WORKER_ID` 列的值进行升序排序（默认情况下，如果没有指定 `ASC`（升序）或 `DESC`，则默认为 `ASC`）。同样，`w` 是 `worker` 表的别名，所以 `w.WORKER_ID` 指的是 `worker` 表中的 `WORKER_ID` 列。

综合来说，`ORDER BY w.SALARY DESC, w.WORKER_ID` 意味着查询结果首先会按照薪水从高到低排序,如果薪水相同,则会按照工作人员ID从小到大排序。这样的排序规则有助于使结果更有序,特别是在处理有相同排序键值的记录时。


Q16
为了找到第二高的薪水,我们可以使用SQL中的子查询来实现。这个子查询首先从`worker`表中选出所有独特的薪水值,然后从这个结果集中选出仅次于最高薪水的薪水。以下是一个实现这一目标的SQL查询:


SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY
FROM worker
WHERE SALARY < (
    SELECT MAX(SALARY)
    FROM worker
);

这个查询的逻辑如下：

1. 内层查询：`SELECT MAX(SALARY) FROM worker` 找到`worker`表中最高的薪水。
2. 外层查询：从`worker`表中选择薪水小于内层查询得到的最高薪水的所有薪水值，然后使用`MAX(SALARY)`找到这些薪水中最高的一个，即第二高的薪水。

执行这个查询将返回薪水仅次于最高薪水的值,根据您给出的数据,输出应该是300000。



Q17:
为了找出拥有超过3人的部门，我们需要对 `worker` 表按照 `DEPARTMENT` 进行分组，然后计算每个部门的工作人员数量，并使用 `HAVING` 子句来过滤出那些人数超过3人的部门。这里是相应的 SQL 查询：

SELECT DEPARTMENT, COUNT(*) AS 'Number of Workers'
FROM worker
GROUP BY DEPARTMENT
HAVING COUNT(*) > 3;


这个查询的步骤如下：

1. `SELECT DEPARTMENT, COUNT(*) AS 'Number of Workers'`：选择 `DEPARTMENT` 列，并计算每个部门的工作人员总数，结果列被命名为 `'Number of Workers'`。

2. `FROM worker`：指定查询从 `worker` 表中获取数据。

3. `GROUP BY DEPARTMENT`：根据 `DEPARTMENT` 列的值将记录分组，使得每个部门的记录聚集在一起。

4. `HAVING COUNT(*) > 3`：过滤出那些在分组后的每个组（即每个部门）中记录数（工作人员数量）大于3的组。

执行上述查询后，将仅返回那些有超过3名工作人员的部门及其工作人员数量。根据您的数据，预期的输出应该是部门 `Admin` 有4名工作人员。



Q18:
为了找出每个部门中薪水最低的员工姓名，我们可以使用窗口函数`ROW_NUMBER()`来为每个部门的员工基于薪水进行排序，然后选择每个分组（部门）中排序第一的记录。不过，考虑到可能希望避免使用窗口函数，我们也可以采用另一种方法，通过子查询来实现：

这里是使用子查询的方法：

SELECT w.DEPARTMENT, w.FIRST_NAME, w.SALARY
FROM worker w
INNER JOIN (
    SELECT DEPARTMENT, MIN(SALARY) AS MinSalary
    FROM worker
    GROUP BY DEPARTMENT
) AS dept_min ON w.DEPARTMENT = dept_min.DEPARTMENT AND w.SALARY = dept_min.MinSalary;


这个查询的逻辑是：

1. 子查询 `SELECT DEPARTMENT, MIN(SALARY) AS MinSalary FROM worker GROUP BY DEPARTMENT` 首先计算每个部门最低的薪水，结果作为 `dept_min`。

2. 主查询通过将 `worker` 表与 `dept_min` 结果集内连接，基于 `DEPARTMENT` 和 `SALARY` 匹配来选择那些薪水等于其所在部门最低薪水的员工。

执行这个查询后，它将列出每个部门中薪水最低的员工的姓名和薪水。



Q19:
为了找出拥有超过3人的部门，我们需要对 `worker` 表按照 `DEPARTMENT` 进行分组，然后计算每个部门的工作人员数量，并使用 `HAVING` 子句来过滤出那些人数超过3人的部门。这里是相应的 SQL 查询：

SELECT DEPARTMENT, COUNT(*) AS 'Number of Workers'
FROM worker
GROUP BY DEPARTMENT
HAVING COUNT(*) > 3;

这个查询的步骤如下：

1. `SELECT DEPARTMENT, COUNT(*) AS 'Number of Workers'`：选择 `DEPARTMENT` 列，并计算每个部门的工作人员总数，结果列被命名为 `'Number of Workers'`。

2. `FROM worker`：指定查询从 `worker` 表中获取数据。

3. `GROUP BY DEPARTMENT`：根据 `DEPARTMENT` 列的值将记录分组，使得每个部门的记录聚集在一起。

4. `HAVING COUNT(*) > 3`：过滤出那些在分组后的每个组（即每个部门）中记录数（工作人员数量）大于3的组。

执行上述查询后，将仅返回那些有超过3名工作人员的部门及其工作人员数量。根据您的数据，预期的输出应该是部门 `Admin` 有4名工作人员。

Q20:
为了找到 `title` 表中根据 `WORKER_TITLE` 和 `AFFECTED_FROM` 字段匹配的重复记录，我们可以使用 `GROUP BY` 语句来分组这些字段，并用 `HAVING` 子句来筛选出计数大于1的组，表示这些组是重复的。下面是完成这个任务的SQL查询：

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) 
FROM title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

这个查询的步骤如下：

1. 从 `title` 表中选择 `WORKER_TITLE` 和 `AFFECTED_FROM` 字段，并计算每个组的记录数。

2. 使用 `GROUP BY WORKER_TITLE, AFFECTED_FROM` 来按照工作标题和受影响日期对记录进行分组。

3. 通过 `HAVING COUNT(*) > 1` 筛选出那些在分组后有超过一个记录的组，这表示这些记录在 `WORKER_TITLE` 和 `AFFECTED_FROM` 字段上是重复的。

4. 最后，`ORDER BY COUNT(*) DESC` 按照重复数量降序排列结果，这样最多重复的记录会排在前面。

执行这个查询将列出那些在 `WORKER_TITLE` 和 `AFFECTED_FROM` 上有重复数据的记录，以及每组重复记录的数量。
