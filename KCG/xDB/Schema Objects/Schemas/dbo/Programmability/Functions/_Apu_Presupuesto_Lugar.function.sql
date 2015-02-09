CREATE FUNCTION [dbo].[_Apu_Presupuesto_Lugar]
(
	@p_Origen char(3),
	@p_Apu_Origen_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Apu_Lugar_Nombre varchar(200)

	if (@p_Origen = 'PRO')
		select  @v_Apu_Lugar_Nombre = 	dbo._Apu_Lugar_Nombre (dbo._Apu_Proyecto_Apu_Lugar_Id (@p_Apu_Origen_Id));
			    

	else if (@p_Origen = 'OFE')
		select  @v_Apu_Lugar_Nombre = 	dbo._Apu_Lugar_Nombre (dbo._Apu_Oferta_Apu_Lugar_Id (@p_Apu_Origen_Id));
			    
    return  @v_Apu_Lugar_Nombre

END















