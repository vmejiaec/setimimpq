CREATE PROCEDURE [dbo].[Apu_Provincia_ByPredeterminadaS]
(
   @p_Ver_Version_Id varchar (17),
   @p_int_empresa_id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT  
    Id,
    Codigo, 
    Nombre,
    Int_Empresa_Id,
    Estado,

    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,
    
    dbo.Estado ('APU_PROVINCIA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre  
FROM         Apu_Provincia
Where  Int_Empresa_Id = @p_Int_Empresa_Id
and id =
(Select apu_provincia_id
 from apu_lugar
 where predeterminada = 'S'
 and int_empresa_id = @p_int_empresa_id)



