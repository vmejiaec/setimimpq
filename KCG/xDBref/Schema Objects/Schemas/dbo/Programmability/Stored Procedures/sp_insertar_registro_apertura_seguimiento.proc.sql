﻿CREATE PROCEDURE sp_insertar_registro_apertura_seguimiento                                                                                                                                                                                                             
  @as_cod_institucion varchar(40),                                                                                                                                                                                                                            
  @as_cod_sucursal  varchar(40),                                                                                                                                                                                                                              
  @as_periodo	    varchar(4),                                                                                                                                                                                                                                 
  @as_cod_tramite   varchar(40),                                                                                                                                                                                                                              
  @al_numero        Integer,                                                                                                                                                                                                                                  
  @as_cod_area      varchar(7),                                                                                                                                                                                                                               
  @ai_num_reest     Integer,
  @as_cedula        varchar(20)                                                                                                                                                                                                                      
AS
                                                                                                                                                                                                                                                                
DECLARE                                                                                                                                                                                                                                                     
        @ai_num_secuenc int,                                                                                                                                                                                                                                  
        @adt_fecha_inicio datetime,                                                                                                                                                                                                                           
        @as_hora_inicio varchar(7),                                                                                                                                                                                                              
        @adt_fecha_final datetime,                                                                                                                                                                                                                            
        @as_hora_final varchar(7),
        @as_cod_tarea varchar(40),                                                                                                                                                                                                                           
        @MENSAJE varchar(200)                                                                                                                                                                                                                                 
	                                                                                                                                                                                                                                                             
SELECT @ai_num_secuenc = 0                                                                                                                                                                                                                                    
SELECT @adt_fecha_inicio= GETDATE()                                                                                                                                                                                                                           
SELECT @adt_fecha_final= GETDATE()
SELECT @as_cod_tarea='REGISTRADO'   
                                                                                                                                                                                                                                                            
/* Obtener la hora de la ejecucion de la accion */
                                                                                                                                                                                                            
SELECT @as_hora_inicio    = SUBSTRING(CONVERT(varchar,@adt_fecha_inicio),13,5)                                                                                                                                                                                
SELECT @as_hora_final     = SUBSTRING(CONVERT(varchar,@adt_fecha_final),13,5)
                                                                                                                                                                                                                                                              
/*select @MENSAJE = ' @as_hora_inicio ' + @as_hora_inicio */                                                                                                                                                                                                       
/*print  @MENSAJE*/
                                                                                                                                                                                                                                               
/*select @MENSAJE = ' @as_hora_final ' + @as_hora_final*/
/*print  @MENSAJE*/
                                                                                                                                                                                                                                                              
/* Obtener el ultimo numero de la secuencia de pasos */                                                                                                                                                                                                       
SELECT @ai_num_secuenc = MAX(GD_NUMERO_SECUENCIAL)
FROM GDSEGTRA
WHERE 	GD_CODIGO_INSTITUCION = @as_cod_institucion AND
	GD_CODIGO_SUCURSAL = @as_cod_sucursal AND   
	GD_PERIODO = @as_periodo AND           
	GD_CODIGO_TRAMITE = @as_cod_tramite AND
	GD_NUMERO = @al_numero           
                                                                                                                                                                                                                                                              
if @ai_num_secuenc IS NULL OR @ai_num_secuenc=0
  BEGIN
     SELECT @ai_num_secuenc = 0
  END
                                                                                                                                                                                                                                                        
/* Siguiente paso */
SELECT @ai_num_secuenc = @ai_num_secuenc + 1 
                                                                                                                                                                                                                                                             
/*select @MENSAJE = '@ai_num_secuenc ' + convert(varchar(15),@ai_num_secuenc)*/
/*print  @MENSAJE */
                                                                                                                                                                                                                                                             
BEGIN TRANSACTION
                                                                                                                                                                                                                                                              
/* Insercion del registro de inicio en seguimiento */
INSERT INTO GDSEGTRA
(
	GD_CODIGO_INSTITUCION,                                                                                                                                                                                                                                       
	GD_CODIGO_SUCURSAL,                                                                                                                                                                                                                                          
	GD_PERIODO,                                                                                                                                                                                                                                                  
	GD_CODIGO_TRAMITE,                                                                                                                                                                                                                                           
	GD_NUMERO,                                                                                                                                                                                                                                                   
	GD_AREA_RESPONSABLE,                                                                                                                                                                                                                                         
	GD_NUMERO_REESTRUCTURA,                                                                                                                                                                                                                                      
	GD_NUMERO_SECUENCIAL,                                                                                                                                                                                                                                        
        GD_AREA_SEGUIMIENTO,
        GD_NUMERO_REESTRUCTURA_SEG, 
	GD_PERSONA_RESPONSABLE,                                                                                                                                                                                                                                      
	GD_CODIGO_TAREA,                                                                                                                                                                                                                                            
	GD_FECHA_INICIO,                                                                                                                                                                                                                                             
	GD_HORA_INICIO,                                                                                                                                                                                                                                              
	GD_FECHA_FINAL,                                                                                                                                                                                                                                           
	GD_HORA_FINAL  
)

VALUES
(
	@as_cod_institucion,                                                                                                                                                                                                                                         
	@as_cod_sucursal,                                                                                                                                                                                                                                            
	@as_periodo,                                                                                                                                                                                                                                                 
	@as_cod_tramite,                                                                                                                                                                                                                                             
	@al_numero,                                                                                                                                                                                                                                                  
	@as_cod_area,                                                                                                                                                                                                                                                
	@ai_num_reest,                                                                                                                                                                                                                                               
        @ai_num_secuenc,                                                                                                                                                                                                                                      
	@as_cod_area,                                                                                                                                                                                                                                                
	@ai_num_reest,                                                                                                                                                                                                                                               
        @as_cedula,                                                                                                                                                                                                                                           
	@as_cod_tarea,                                                                                                                                                                                                                                               
	@adt_fecha_inicio,                                                                                                                                                                                                                                           
	@as_hora_inicio,                                                                                                                                                                                                                                             
	@adt_fecha_final,                                                                                                                                                                                                                                            
	@as_hora_final                                                                                                                                                                                                                                               
)
                                                                                                                                                                                                                                                             
if @@error <> 0 
BEGIN
     ROLLBACK TRANSACTION 
     raiserror('Atención : No se actualizo la información (GDSEGTRA)', 16, -1)
     RETURN
END
                                                                                                                                                                                                                                                             
COMMIT TRANSACTION
