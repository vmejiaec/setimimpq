CREATE PROCEDURE [dbo].[Dic_Objeto_ByMantenimiento]
(
  @p_ver_version_id varchar(17),
  @p_int_empresa_id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Nombre, 
    Dic_Modulo_Id, 
    Numero,  
    Estado,
    dbo._Dic_Modulo_Codigo (Dic_Modulo_Id) Dic_Modulo_Codigo,
    dbo._Dic_Modulo_Nombre (Dic_Modulo_Id) Dic_Modulo_Nombre,
    dbo.Estado ('DIC_OBJETO','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM         Dic_Objeto
WHERE ID NOT IN (
SELECT DIC_OBJETO_ID
FROM AUD_PAR_AUDITORIA)
or   (Select count(*) 
       from Aud_Par_Auditoria 
       where dic_objeto.id = aud_par_auditoria.dic_objeto_id) 
       < (SELECT COUNT(*) FROM INT_SUCURSAL
          WHERE int_empresa_id = @p_int_empresa_id)