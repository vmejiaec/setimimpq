create FUNCTION [dbo].[Dominio]
(
	@p_Objeto varchar(200),
    @p_Campo varchar(200),
    @p_Dominio char(3),
    @p_ver_Version_id varchar(17)
)
RETURNS varchar(500) AS
BEGIN
    declare 
        @v_nombre varchar(500),
        @v_dic_dominio_id varchar(17) ,
        @v_dic_objeto_id varchar(17),
        @v_dic_campo_id varchar(17)
  
    exec @v_dic_objeto_id = _dic_objeto_id @p_objeto
    exec @v_dic_campo_id = _dic_campo_Id @v_dic_objeto_id, @p_campo
    exec @v_dic_dominio_id = _dic_dominio_id @v_dic_campo_id, @p_dominio
    exec @v_nombre = _ver_dominio_nombre @v_dic_dominio_id, @p_ver_version_id

    RETURN  @v_nombre
END
