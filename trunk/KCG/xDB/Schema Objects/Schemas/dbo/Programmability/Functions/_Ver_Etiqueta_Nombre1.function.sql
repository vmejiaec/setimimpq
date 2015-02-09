create FUNCTION [dbo].[_Ver_Etiqueta_Nombre1]
(
	@p_ver_version_id varchar(17),
    @p_dic_rotulo_id  varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  ver_etiqueta 
             where ver_version_id = @p_ver_version_id
              and dic_rotulo_id = @p_dic_rotulo_id)

    RETURN  @v_nombre

END













