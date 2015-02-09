create FUNCTION [dbo].[Dominio_Ids]
(
	@p_dic_campo_id varchar(17),
    @p_Dominio char(3),
    @p_ver_Version_id varchar(17)
)
RETURNS varchar(500) AS
BEGIN
    declare 
        @v_nombre varchar(500),
        @v_dic_dominio_id varchar(17)

    exec @v_dic_dominio_id = _dic_dominio_id @p_dic_campo_id, @p_dominio
    exec @v_nombre = _ver_dominio_nombre @v_dic_dominio_id, @p_ver_version_id

    RETURN  @v_nombre
END

