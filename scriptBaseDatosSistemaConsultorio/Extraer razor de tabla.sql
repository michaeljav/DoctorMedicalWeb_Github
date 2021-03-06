/****** Script for SelectTopNRows command from SSMS  ******/
use DoctorMedicalWeb
go

select getdate()

  /*Get Name razor c#*/
  select '@Html.HiddenFor(model => model.usar_ConsultaMedicaHistorial.'+COLUMN_NAME+')' from INFORMATION_SCHEMA.COLUMNS
  where TABLE_NAME = 'ConsultaMedicaHistorial'

  /*Set enum  to all columns */
    select ','+FormPantalla+'="'+FormDescripcion+'"' from sdoc.Formularios
	  select FormDescripcion+'="'+FormDescripcion+'",' from sdoc.Formularios
	  	  select FormDescripcion+',' from sdoc.Formularios

go
  /*Set prefix  to all columns */
    select 'CMedica.'+COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS
  where TABLE_NAME = 'ConsultaMedica'
  go
    select 'recAnalisiClini.'+COLUMN_NAME+'=usar_resetaCompList.'+COLUMN_NAME+';' from INFORMATION_SCHEMA.COLUMNS
  where TABLE_NAME = 'Recetas'
  go
    select COLUMN_NAME,DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
  where TABLE_NAME = 'ConsultaMedicaHistorial'
go
  /*Set prefix  to all columns */
  declare @usarTabla  varchar(Max) = 'usar_ConsultaMedica'
  declare @tableConsultar varchar(Max) = 'ConsultaMedica'

    select ' <div class="form-group ">
	@Html.LabelFor(c => c.'+@usarTabla+'.'+COLUMN_NAME+')
           '+(CASE DATA_TYPE  WHEN 'bit'  THEN ' @Html.CheckBoxFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', new { @class = "form-control  "})' 
			                 WHEN 'nvarchar' THEN '@Html.TextBoxFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', new { @class = "form-control  "})'
						     WHEN 'varchar' THEN ' @Html.TextBoxFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', new { @class = "form-control  "})'
							 WHEN 'datetime' THEN '@Html.EJ().DatePickerFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+').DateFormat("dd/MM/yyyy").Width("100%")'
							 WHEN 'int'       THEN ' @Html.TextBoxFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', new { @class = "form-control  "})'
							  WHEN 'decimal'       THEN ' @Html.TextBoxFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', new { @class = "form-control  "})'
							   WHEN 'time'       THEN ' @Html.TextBoxFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', new { @class = "form-control  "})'
							 END )+'
			@Html.ValidationMessageFor(model => model.'+@usarTabla+'.'+COLUMN_NAME+', null, new { @class = "label label-danger" }) </div>'+ char(13)  + char(10),DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
  where TABLE_NAME =@tableConsultar


