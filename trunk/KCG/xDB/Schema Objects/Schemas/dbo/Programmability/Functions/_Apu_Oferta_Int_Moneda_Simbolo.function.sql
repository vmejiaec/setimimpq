create FUNCTION [dbo].[_Apu_Oferta_Int_Moneda_Simbolo]
(
	@p_Apu_Oferta_id varchar(17)
)
RETURNS varchar(5)
BEGIN
    
    declare 
      @v_Int_Moneda_Id varchar(17),
      @v_Simbolo varchar(5)
      
      
      exec @v_Int_Moneda_Id 
          = dbo._Apu_Oferta_Int_Moneda_Id @p_Apu_Oferta_Id
      
      exec @v_simbolo 
          = dbo._Int_Moneda_Simbolo @v_Int_Moneda_Id

    return  @v_simbolo

END
















