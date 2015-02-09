


CREATE view [dbo].[GD_Funcionario_Area] as
select 
	fa.GD_CODIGO_AREA  Area_Codigo, 
	(select au.GD_NOMBRE_AREA from GDAREUSU au where au.GD_CODIGO_AREA = fa.GD_CODIGO_AREA) Area_Nombre,
	fa.GD_CODIGO_PERSONA Persona_Codigo,
	(select fs.GD_NOMBRES + ' ' + fs.GD_APELLIDOS from GDFUNCIONARIOS fs where fs.GD_CODIGO_PERSONA = fa.GD_CODIGO_PERSONA) Persona_Nombre,
	isnull((select fs.GD_CARGO from GDFUNCIONARIOS fs where fs.GD_CODIGO_PERSONA = fa.GD_CODIGO_PERSONA),'') Persona_Cargo,
	(select fs.GD_USER_NAME from GDFUNCIONARIOS fs where fs.GD_CODIGO_PERSONA = fa.GD_CODIGO_PERSONA) Persona_Usuario,
	(select fs.GD_USER_NAME from GDFUNCIONARIOS fs where fs.GD_CODIGO_PERSONA = fa.GD_CODIGO_PERSONA) Persona_Password
from 
	GDFUNCIONARIO_AREA fa



