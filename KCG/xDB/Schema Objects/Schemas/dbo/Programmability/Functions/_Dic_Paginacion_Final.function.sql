create FUNCTION [dbo].[_Dic_Paginacion_Final]
(
    @p_par_servidor_id varchar(17),
    @p_dic_objeto_nombre varchar(500),
	@p_secuencia int
)
RETURNS varchar (17)
begin 
	declare
		@v_seccion_maxima int,
		@v_seccion int,
        @v_dic_objeto_id varchar(17),
        @v_dic_paginacion_id varchar(17),
        @v_id_Final varchar(17)

        set @v_dic_objeto_id = dbo._dic_objeto_id (@p_dic_objeto_nombre)

		set @v_seccion_maxima = dbo._Dic_Paginacion_NumeroSecciones (@p_par_servidor_id,
																	@v_dic_objeto_id)

		if (@p_secuencia > @v_seccion_maxima)
			set @v_seccion = @v_seccion_maxima
		else
			set @v_seccion = @p_secuencia
   
    
		if (@p_secuencia < 1) 
			set @v_seccion = 1
		else
			set @v_seccion = @p_secuencia

    exec @v_dic_paginacion_id = 
         _dic_paginacion_id1 @p_par_servidor_id, 
                             @v_dic_objeto_id,
                             @v_seccion

    exec @v_id_Final = _dic_paginacion_Id_Final @v_dic_paginacion_id
                        
    RETURN  @v_id_Final

END














