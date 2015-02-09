CREATE FUNCTION [dbo].[_Apu_Presupuesto_Codigo_Institucional]
(
	@p_Origen char(3),
	@p_Apu_Origen_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo_institucion varchar(200)

	if (@p_Origen = 'PRO')
		select  @v_codigo_institucion = 
			    (select Codigo_Institucion
				 from  apu_proyecto
				where id = @p_Apu_Origen_Id)

	else if (@p_Origen = 'OFE')
		
		select  @v_codigo_institucion = 
			    (select Codigo_Institucion
				 from  Apu_Oferta
				where id = @p_Apu_Origen_Id)

    RETURN  isnull(@v_Codigo_Institucion,' ')

END
