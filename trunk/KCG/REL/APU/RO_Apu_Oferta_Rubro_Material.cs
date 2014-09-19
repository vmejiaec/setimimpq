using System.Collections.Generic;
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
    /// Tabla:Apu_Oferta_Rubro_Material
    /// </summary>
    public class RO_Apu_Oferta_Rubro_Material
    {
    #region Adapter
    private DO_Apu_Oferta_Rubro_Material _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public DO_Apu_Oferta_Rubro_Material Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new DO_Apu_Oferta_Rubro_Material();
     return _Adapter;
     }
     }
   
    #endregion
    #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]

        public  DataTable GetByOferta(Scope s, string Apu_Oferta_Id)
        {
         
            return EntidadDT.GetDT(Adapter.GetByOferta(s, Apu_Oferta_Id).ToArray());
          
           
        }
          #endregion
    }
    }
