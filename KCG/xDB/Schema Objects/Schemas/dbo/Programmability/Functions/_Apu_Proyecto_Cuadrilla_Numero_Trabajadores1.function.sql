create FUNCTION [dbo].[_Apu_Proyecto_Cuadrilla_Numero_Trabajadores1]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_total numeric (17,4),
      @v_apu_proyecto_mano_obra_id varchar(17),
      @v_costo numeric (17,4),
      @v_resultado numeric (17,4)


    exec @v_total =   dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Cuadrilla 
                      @p_apu_proyecto_id, 
                      @p_apu_mano_obra_id

    
    exec @v_costo =   dbo._Apu_Proyecto_Mano_Obra_Costo_Hora1 
                      @p_apu_proyecto_id, @p_apu_mano_obra_id
    if (@v_costo = 0)
        set @v_resultado = 0
    else              
        exec @v_resultado = dbo.__division_cuatro_decimales @v_total, @v_costo  
   
    RETURN  isnull(@v_resultado,0)

END





