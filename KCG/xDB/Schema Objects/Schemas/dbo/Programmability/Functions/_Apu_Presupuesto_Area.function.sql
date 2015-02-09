CREATE FUNCTION [dbo].[_Apu_Presupuesto_Area]
(
	@p_Origen char(3),
	@p_Apu_Origen_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Area numeric(17,4)

	if (@p_Origen = 'PRO')
		select  @v_Area = 
			    (select Area
				 from  Apu_Proyecto
				where Id = @p_Apu_Origen_Id)

	else if (@p_Origen = 'OFE')
		
		select  @v_Area = 
			    (select Area
				 from  Apu_Oferta
				where Id = @p_Apu_Origen_Id)

    RETURN  @v_Area

END
















