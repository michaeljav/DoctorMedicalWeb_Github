
--CREAR COLUMNAS ID Y CODIGO
  select 
  'ALTER TABLE '+TABLE_NAME+'  ADD Id INT not null IDENTITY(1,1), Codigo nvarchar(max)  not null  default ''''',
  TABLE_NAME,
  * from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME != 'sysdiagrams'
  order by 5

    --SELECT ID
   select 
  ' select id from '+TABLE_NAME,
  TABLE_NAME,
  * from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME != 'sysdiagrams'
  order by 5

    --SELECT CODIGO
     select 
  ' select codigo from  '+TABLE_NAME,
  TABLE_NAME,
  * from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME != 'sysdiagrams'
  order by 5

    --DROP ID COLUM IDENTITY
     select 
  ' ALTER TABLE '+TABLE_NAME+' DROP COLUMN id',
  TABLE_NAME,
  * from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME != 'sysdiagrams'
  order by 5

  --DROP CONSTRAINT DEFAULT CODIGO
select 
 'ALTER TABLE '+TableName+' DROP CONSTRAINT '+NameofConstraint,* 
from (
SELECT OBJECT_NAME(OBJECT_ID) AS NameofConstraint,
--SCHEMA_NAME(schema_id) AS SchemaName,
OBJECT_NAME(parent_object_id) AS TableName,
--type_desc AS ConstraintType
*
FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT'
and OBJECT_NAME(OBJECT_ID) LIKE 'DF%Codig%'
) a inner join INFORMATION_SCHEMA.TABLES t
on UPPER(t.TABLE_NAME) =UPPER(a.TableName)
order by t.TABLE_NAME


 
 --DROP CODIGO COLUM 
     select 
  ' ALTER TABLE '+TABLE_NAME+' DROP COLUMN codigo',
  TABLE_NAME,
  * from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE' and TABLE_NAME != 'sysdiagrams'
  order by 5

  -- VER TODO LOS CONSTRAINT DE UNA TABLA 
  SELECT OBJECT_NAME(OBJECT_ID) AS NameofConstraint,
SCHEMA_NAME(schema_id) AS SchemaName,
OBJECT_NAME(parent_object_id) AS TableName,
type_desc AS ConstraintType
FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT'
and OBJECT_NAME(OBJECT_ID) LIKE 'DF%Codig%'

  -- VER TODO LOS CONSTRAINT DE UNA TABLA 
  exec sp_helpconstraint 'vACUNAS'


