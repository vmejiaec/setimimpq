
CREATE PROCEDURE [dbo].[V_INT_Funcionario_Area_SelLikePersona_Nombre]
(
@p_Persona_Nombre varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT        Area_Codigo, Area_Nombre, Persona_Codigo, Persona_Nombre, Persona_Cargo, Persona_Usuario, Persona_Password
FROM            V_INT_Funcionario_Area
where 
Persona_Codigo not in (
select r.Numero 
from Par_Razon_Social r, V_INT_Funcionario_Area f
where r.Par_Tipo_Identificacion_Id = '1'
and r.Numero = f.Persona_Codigo
)
and Persona_Nombre Like '%' + @p_Persona_Nombre + '%'
order by Area_Nombre, Persona_Nombre