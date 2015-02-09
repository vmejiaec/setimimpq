CREATE PROCEDURE sp_administracion_tramites
  @as_codigo_institucion varchar(40),
  @as_codigo_sucursal varchar(40),
  @as_periodo_vigencia varchar(4),
  @as_codigo_tramite varchar(40),  
  @ai_numero  integer,          
  @as_area_responsable varchar(8),   
  @ai_num_reest   integer,
  @as_persona_responsable varchar(20),   
  @as_codigo_tarea varchar(40)
AS

DECLARE @ai_numero_secuencial integer
DECLARE @ai_numero_adjuntos integer

--SELECT @ai_numero_secuencial = MAX(GD_NUMERO_SECUENCIAL)
SELECT @ai_numero_secuencial = GD_NUMERO_SECUENCIAL
FROM GDSEGTRA
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
               GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
               GD_PERIODO=@as_periodo_vigencia AND
               GD_CODIGO_TRAMITE=@as_codigo_tramite AND
               GD_NUMERO=@ai_numero AND
               GD_AREA_RESPONSABLE =@as_area_responsable AND
               GD_NUMERO_REESTRUCTURA= @ai_num_reest   AND
               GD_CODIGO_TAREA=@as_codigo_tarea 

if @ai_numero_secuencial>0
BEGIN
/*Borrado del ultimo seguimiento  GDSEGTRA*/
DELETE GDSEGTRA
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
               GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
               GD_PERIODO=@as_periodo_vigencia AND
               GD_CODIGO_TRAMITE=@as_codigo_tramite AND
               GD_NUMERO=@ai_numero AND
               GD_AREA_RESPONSABLE =@as_area_responsable AND
               GD_NUMERO_REESTRUCTURA= @ai_num_reest   AND
               GD_CODIGO_TAREA =@as_codigo_tarea AND
               GD_NUMERO_SECUENCIAL =@ai_numero_secuencial
END

if @@error <> 0 
BEGIN
     ROLLBACK TRANSACTION 
     raiserror('Atención : No se actualizo la información (GDSEGTRA)', 16, -1)
     RETURN
END

/*Borrado de los adjuntos para la tarea asociada */
SELECT @ai_numero_adjuntos=COUNT(*)
FROM GDADJUNTOS
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
               GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
               GD_PERIODO=@as_periodo_vigencia AND
               GD_CODIGO_TRAMITE=@as_codigo_tramite AND
               GD_NUMERO=@ai_numero AND
               GD_CODIGO_AREA =@as_area_responsable AND
               GD_NUMERO_REESTRUCTURA= @ai_num_reest   AND
               GD_CODIGO_TAREA =@as_codigo_tarea 

if  @ai_numero_adjuntos>0
BEGIN

DELETE GDADJUNTOS
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
               GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
               GD_PERIODO=@as_periodo_vigencia AND
               GD_CODIGO_TRAMITE=@as_codigo_tramite AND
               GD_NUMERO=@ai_numero AND
               GD_CODIGO_AREA =@as_area_responsable AND
               GD_NUMERO_REESTRUCTURA= @ai_num_reest   AND
               GD_CODIGO_TAREA =@as_codigo_tarea 
END

if @@error <> 0 
BEGIN
     ROLLBACK TRANSACTION 
     raiserror('Atención : No se actualizo la información (GDADJUNTOS)', 16, -1)
     RETURN
END
