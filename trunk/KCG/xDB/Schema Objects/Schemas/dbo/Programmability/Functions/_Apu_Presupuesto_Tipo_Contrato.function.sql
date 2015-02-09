create FUNCTION [dbo].[_Apu_Presupuesto_Tipo_Contrato]
(
	@p_Origen char(3),
	@p_Apu_Origen_Id varchar(17)
)
RETURNS varchar(3)
BEGIN
    
    declare @v_Tipo_Contrato varchar(3)

	if (@p_Origen = 'PRO')
		select  @v_Tipo_Contrato = 
			    (select Tipo_Contrato
				 from  Apu_proyecto
				where id = @p_Apu_Origen_Id)

	else if (@p_Origen = 'OFE')
		
		select  @v_Tipo_Contrato = 
			    (select Tipo_Contrato
				 from  Apu_Oferta
				where id = @p_Apu_Origen_Id)

    RETURN  isnull(@v_Tipo_Contrato,' ')

END
