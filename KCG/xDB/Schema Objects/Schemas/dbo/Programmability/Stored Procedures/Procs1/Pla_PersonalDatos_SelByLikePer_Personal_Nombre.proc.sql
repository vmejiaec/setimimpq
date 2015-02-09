CREATE PROCEDURE [dbo].[Pla_PersonalDatos_SelByLikePer_Personal_Nombre]
(
    @p_Per_Personal_Nombre varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT        
	Id, 
	Per_Personal_Id,
	(select raz.Nombre from Par_Razon_Social raz where raz.Id in
	   (select per.Par_Razon_Social_Id from Per_Personal per where per.Id = Per_Personal_Id)
	) Per_Personal_Nombre,
	(select raz.Numero from Par_Razon_Social raz where raz.Id in
	   (select per.Par_Razon_Social_Id from Per_Personal per where per.Id = Per_Personal_Id)
	) Per_Personal_NumeroDoc,
	Pie_Firma_Nombre, 
	Pie_Firma_Cargo, 
	Email_Inst,
	Pie_Firma_Iniciales
FROM            
	Pla_PersonalDatos
where
	(select raz.Nombre from Par_Razon_Social raz where raz.Id in
	   (select per.Par_Razon_Social_Id from Per_Personal per where per.Id = Per_Personal_Id)
	) like '%' + @p_Per_Personal_Nombre + '%'
