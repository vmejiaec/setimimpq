

-- Permite calcular el costo hora de la Mano de Obra para el proyecto
CREATE FUNCTION [dbo].[_Apu_Oferta_Mano_Obra_Costo_Hora]
(
	@p_apu_oferta_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
   declare 
          @v_Costo_hora   numeric(17,4)
          

 select  @v_Costo_Hora =
          ( Select dbo.__division_cuatro_decimales (Costo_Diario, 8)
            from apu_oferta_mano_obra
            where Id = @p_apu_oferta_mano_obra_id)
                           
 return  isnull(@v_Costo_Hora,0)

END





