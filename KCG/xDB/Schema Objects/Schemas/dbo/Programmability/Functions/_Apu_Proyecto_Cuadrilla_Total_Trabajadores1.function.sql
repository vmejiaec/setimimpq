create FUNCTION [dbo].[_Apu_Proyecto_Cuadrilla_Total_Trabajadores1]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_total numeric (17,4),
	  @v_total_t numeric (17,4),
      @v_costo numeric (17,4),
      @v_resultado numeric (17,4),
	  @p_apu_mano_obra_id varchar(17)
	  set @v_total_t=0

	DECLARE total_mano CURSOR FOR

	Select Apu_Mano_Obra_Id
	from Apu_Proyecto_Mano_Obra
	where Apu_Proyecto_Id= @p_apu_proyecto_id
	
	OPEN total_mano


	FETCH NEXT FROM total_mano INTO @p_apu_mano_obra_id

	WHILE @@FETCH_STATUS = 0
	BEGIN
		exec @v_total =   dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Cuadrilla 
						  @p_apu_proyecto_id, 
						  @p_apu_mano_obra_id

	    
		exec @v_costo =   dbo._Apu_Proyecto_Mano_Obra_Costo_Hora1 
						  @p_apu_proyecto_id, @p_apu_mano_obra_id
		if (@v_costo = 0)
			set @v_resultado = 0
		else              
			exec @v_resultado = dbo.__division_cuatro_decimales @v_total, @v_costo  

		set @v_total_t= dbo.__suma_cuatro_decimales_2 (@v_total_t ,@v_resultado)
	
		FETCH NEXT FROM total_mano INTO @p_apu_mano_obra_id
	END

    CLOSE total_mano
    DEALLOCATE total_mano

    RETURN  isnull(@v_total_t,0)

END




