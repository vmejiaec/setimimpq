using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;
    
    namespace REL.APU
    {
    [DataObject]
    
    public class RO_Apu_Rubro_Insumo
    {
    #region Adapter
    private  DO_Apu_Rubro_Insumo _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public DO_Apu_Rubro_Insumo Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new DO_Apu_Rubro_Insumo();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Rubro_Insumo
    /// </summary> 
    /// <returns>Lista de objetos Apu_Rubro_Insumo</returns> 
    
      public DataTable GetByRubro( Scope s , string apu_rubro_id)
          {
              return EntidadDT.GetDT(Adapter.GetByRubro(s, apu_rubro_id).ToArray());

          }
      
          #endregion
    }
    }
