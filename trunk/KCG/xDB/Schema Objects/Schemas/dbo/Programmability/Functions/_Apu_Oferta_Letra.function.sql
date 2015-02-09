CREATE FUNCTION [dbo].[_Apu_Oferta_Letra]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_indice_id varchar(17),
    @p_numero_fila int
)
RETURNS char(1)
BEGIN
    
    declare 
       @v_int_sucursal_Id varchar(17),
       @v_int_empresa_id varchar(17),
       @v_apu_indice_varios_id varchar(17),
       @v_ManoObra_apu_indice_id varchar(17),
       @v_numero int,
       @v_letra  char(1)
       
    exec @v_int_sucursal_id = dbo._apu_Oferta_int_sucursal_id @p_apu_Oferta_id
    exec @v_int_empresa_id = dbo._int_sucursal_int_empresa_id @v_int_sucursal_id
    exec @v_apu_indice_varios_id = dbo._apu_indice_varios @v_int_empresa_id
    exec @v_ManoObra_apu_indice_id = dbo._apu_parametros_ManoObra_Apu_Indice_Id @v_int_sucursal_id

    if (@v_apu_indice_varios_id = @p_apu_indice_id) 
          set @v_letra  = 'X';
    else
       if  (@v_ManoObra_apu_indice_id = @p_apu_indice_id)
          set @v_letra = 'B';
    else
     begin
          set @v_numero = 66 + @p_numero_fila;
    
          set @v_letra = char(@v_numero);
     end
    
    RETURN @v_letra

END











