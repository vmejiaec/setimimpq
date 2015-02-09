CREATE PROCEDURE [dbo].[V_INT_Funcionario_Area_Sel]
AS
	SET NOCOUNT ON;
SELECT        Area_Codigo, Area_Nombre, Persona_Codigo, Persona_Nombre, Persona_Cargo, Persona_Usuario, Persona_Password
FROM            V_INT_Funcionario_Area
order by Area_Nombre, Persona_Nombre