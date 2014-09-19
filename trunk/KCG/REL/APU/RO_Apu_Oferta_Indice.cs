
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;

    namespace REL.APU
    {
    [DataObject]
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Oferta_Indice
    /// </summary>
    public class RO_Apu_Oferta_Indice
    {
    #region Adapter
    private static DO_Apu_Oferta_Indice _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public static DO_Apu_Oferta_Indice Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new DO_Apu_Oferta_Indice();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta_Indice
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta_Indice</returns> 
    public static DataTable Get ( Scope s,string  Apu_Oferta_Id )
    {
        return EntidadDT.GetDT(Adapter.Get(s, Apu_Oferta_Id).ToArray());

    }
      #endregion
    
    }
    }
