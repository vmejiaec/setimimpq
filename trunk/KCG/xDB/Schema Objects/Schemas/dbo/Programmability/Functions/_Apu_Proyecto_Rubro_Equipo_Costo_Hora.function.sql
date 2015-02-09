CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Equipo_Costo_Hora]
(
	@p_Apu_Proyecto_Rubro_Equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
       @v_costo_diario numeric (17,4),
       @v_hora int,
       @v_costo_hora numeric (17,4)

   set @v_hora = 8     
       
   exec @v_costo_diario
        = dbo._Apu_Proyecto_Rubro_Equipo_Costo_Diario @p_Apu_Proyecto_Rubro_Equipo_id
   
   exec @v_costo_hora = dbo.__division_cuatro_decimales @v_costo_diario, @v_hora

   return isnull(@v_Costo_hora,0)

END







