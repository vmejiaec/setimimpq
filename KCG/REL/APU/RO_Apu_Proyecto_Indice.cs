using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;
    
    namespace REL.APU
    {
        [DataObject]
    public class RO_Apu_Proyecto_Indice
    {
    #region Adapter
    private static DO_Apu_Proyecto_Indice _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public static DO_Apu_Proyecto_Indice Adapter
    {
        get
        {
        if (_Adapter == null)
        _Adapter = new DO_Apu_Proyecto_Indice();
        return _Adapter;
        }
     }
   
    #endregion
    #region Obtención de datos
    [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s, string Apu_Proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.Get(s, Apu_Proyecto_Id).ToArray());
        }
      #endregion
    
    }
    }
