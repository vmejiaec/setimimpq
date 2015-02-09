create FUNCTION [dbo].[_Ver_Etiqueta_Imagen_Desactiva]
(
	@p_ver_version_id varchar(17),
    @p_dic_rotulo_id  varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
        @v_imagen varchar(500),
        @v_ruta_imagen varchar(500)

	select  @v_imagen = 
            (select imagen_desactiva 
             from  ver_etiqueta 
             where ver_version_id = @p_ver_version_id
              and dic_rotulo_id = @p_dic_rotulo_id)

    exec @v_ruta_imagen = _ver_version_ruta_imagen @p_ver_version_id
   
    RETURN  @v_ruta_imagen + @v_imagen

END













