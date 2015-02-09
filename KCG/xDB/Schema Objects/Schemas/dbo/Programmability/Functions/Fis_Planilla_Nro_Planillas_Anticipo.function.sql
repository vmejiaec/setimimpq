CREATE FUNCTION [dbo].[Fis_Planilla_Nro_Planillas_Anticipo]
(
	@p_Apu_Presupuesto_Id varchar(17),
	@p_Tipo varchar (3)
)
RETURNS int
BEGIN
    
    declare @v_Nro_Planillas_Anticipo int

	select  @v_Nro_Planillas_Anticipo = 
            (select count(Tipo_Planilla) 
             from Fis_Planilla
             where Apu_Presupuesto_Id = @p_Apu_Presupuesto_Id
			 and Tipo_Planilla=@p_Tipo)

    RETURN  isnull(@v_Nro_Planillas_Anticipo,0)

END

